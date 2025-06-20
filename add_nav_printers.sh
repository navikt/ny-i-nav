#!/bin/bash

kernel_name="$(uname -s)"

case "${kernel_name}" in
Linux*)
  warning="
      This requires that smbclient is installed.
      smbclient can be installed on the command line like so:

      'sudo apt install smbclient'
    "
  ;;
esac

cat <<EOF
This script will now download a generic Lexmark driver
and add the Nav printer to CUPS.

${warning}

You will be prompted for your sudo/admin password.

EOF

read -p "# Do you wish to proceed? " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then

  case "${kernel_name}" in
  Linux*)
    echo "Downloading Lexmark X950 series PPD"
    curl -L "https://www.openprinting.org/download/PPD/Lexmark/Lexmark_X950_Series.ppd" \
      -o postscript-lexmark-x950.ppd
    sudo mkdir -p /usr/local/share/ppd/
    sudo mv postscript-lexmark-x950.ppd /usr/local/share/ppd/
    ppd_path=/usr/local/share/ppd/postscript-lexmark-x950.ppd
    ;;
  Darwin*)
    curl -L https://raw.githubusercontent.com/nais/naisdevice-nav-mac-up/04ce685446c1c031de9a96f28818267597b5ec05/print/Universal_Color_Print.pkg \
      -o Universal_Color_Print.pkg

    echo "Run Lexmark installer."
    sudo /usr/sbin/installer -pkg Universal_Color_Print.pkg -target /
    ppd_path="/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd"
    echo "Cleaning up installer."
    rm -rf Universal_Color_Print.pkg
    ;;
  *)
    echo "Unsupported platform: ${kernel_name}"
    exit 2
    ;;
  esac

  case "${kernel_name}" in
  Linux*)
    echo " # Adding Nav Printer to CUPS."
    sudo /usr/sbin/lpadmin -E -p "Nav_SikkerPrint" \
      -v "smb://10.88.0.21/FargeDuplex%20IKSS" \
      -P "${ppd_path}" \
      -o printer-is-shared=false \
      -o APOptionalDuplexer=True \
      -o auth-info-required=username,password
    ;;
  Darwin*)
    echo " # Adding Nav Printer to CUPS."
    sudo /usr/sbin/lpadmin -E -p "Nav_SikkerPrint" \
      -v "smb://A01PSVW005.adeo.no/MacUtskrift?encryption=no" \
      -P "${ppd_path}" \
      -o printer-is-shared=false \
      -o APOptionalDuplexer=True \
      -o auth-info-required=username,password
    ;;
  esac

  sudo /usr/sbin/cupsenable "Nav_SikkerPrint"
  sudo /usr/sbin/cupsaccept "Nav_SikkerPrint"

  case "${kernel_name}" in
  Linux*)
    echo "Restarting cups service"
    sudo systemctl restart cups
    ;;
  esac

  echo "# Done!"
  echo "# Oh, BTW - Remember - rainforest.."

else
  exit 1
fi
exit 0
