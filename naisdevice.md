# Architectural Decision Record: Naisdevice

## Context

**What is Naisdevice?**

Naisdevice is the mechanism designed to secure developers' laptops within NAV. It is a platform-agnostic solution intended to:
- Ensure endpoint security for developer machines.
- Promote awareness of endpoint security.
- Simplify access to runtime environments.

**Why was Naisdevice developed?**

NAV initially adopted an off-the-shelf Mobile Device Management (MDM) solution to address fleet management and endpoint compliance. However, several limitations became apparent, particularly for developers using Mac or Linux machines:

1. **Developer Autonomy Conflict**:
   - Developers require administrative access (“local admin”) to perform their work effectively. The MDM model—which assumes full IT control—clashes with this requirement.
   - This resulted in loss of visibility into the true state of developer machines and created a false sense of security.

2. **Lack of Linux Support**:
   - Many developers prefer Linux due to its flexibility and suitability for their workflows.
   - The MDM solution's Linux support was either nonexistent or inadequate.

3. **User Frustrations**:
   - Developers experienced issues such as forced updates, unexpected reboots, and degraded system performance due to intrusive antivirus software.
   - These issues led to inefficiencies and workarounds that introduced potential security risks.

4. **Insufficient Compliance Mechanisms**:
   - The compliance mechanism ("Compliant Device") was binary and unreliable, offering either full access or none.
   - Security flaws, such as the ability to export compliance certificates, undermined trust in the system.

Given these shortcomings, the decision was made to develop Naisdevice as an alternative.

## Decision

NAV decided to create a custom solution, "Naisdevice," to address the limitations of the existing MDM solution. The objectives were:

1. Allow developers to choose tools that maximize their productivity.
2. Provide accurate, up-to-date information about machine status.
3. Ensure transparency about collected data.
4. Focus on identifying risky behavior rather than enforcing rigid settings.
5. Enable flexibility to adapt the solution as needed.
6. Educate users about security risks and remediation steps.
7. Minimize control over machines and avoid vendor lock-in.
8. Remove barriers that slow productivity or encourage circumvention.
9. Support external consultants using non-NAV-owned devices.

## Implementation

To meet these objectives, a combination of SaaS, open-source software, and custom components was employed:

### Core Components:

1. **Kolide**:
   - Provides insight into device status and allows security policies to be defined and enforced.
   - Encourages a collaborative approach to security, focusing on user education and low-friction compliance.

2. **Osquery**:
   - Gathers information about devices using a database-like interface for queries.
   - Efficient and non-intrusive, suitable for developer environments.

3. **Slack**:
   - Serves as the communication channel for notifying users about issues, risks, and remediation steps.

4. **WireGuard**:
   - A modern VPN solution providing secure access to specific services rather than broad network segments.

5. **Naisdevice API Server & Agent**:
   - Custom components written in PHP and Go that integrate the various tools and manage device compliance.
   - Handle access provisioning based on Azure AD group memberships.

6. **Just-In-Time (JIT) Access**:
   - A mechanism requiring users to request access to sensitive resources with justification and time constraints.

7. **Do’s & Don’ts Agreement**:
   - A simple agreement outlining user responsibilities, fostering explicit expectations instead of enforced rules.

### Practical Considerations:

- The solution was tested internally and externally, demonstrating higher security standards than the previous MDM solution.
- A phased migration plan was established, aiming to move all developer machines to Naisdevice by the end of 2023.
- External consultants can now securely use their own devices without requiring NAV-issued hardware.

## Outcome

Naisdevice represents a significant shift from traditional MDM approaches, aligning with NAV’s values of developer autonomy and security. The solution provides:

1. Improved developer satisfaction and productivity.
2. A more accurate understanding of device security.
3. A flexible, transparent, and user-friendly approach to endpoint management.
4. Cost savings from reduced hardware procurement and maintenance.

## Lessons Learned

1. Traditional MDM solutions are not always compatible with modern development workflows.
2. Trusting and educating users fosters better security behavior.
3. A hybrid approach using SaaS, open-source tools, and custom integrations can effectively address diverse needs.

## Future Steps

1. Complete the migration of all developer machines to Naisdevice.
2. Continue refining the solution based on user feedback and emerging security needs.
3. Explore additional use cases for Naisdevice, including broader adoption across NAV.

---

### Related Links
- [Kolide’s Honest Security Philosophy](https://honest.security/)
