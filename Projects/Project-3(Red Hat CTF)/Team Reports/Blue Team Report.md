# Blue Team: Summary of Operations

## Table of Contents
- Network Topology
- Description of Targets
- Monitoring the Targets
- Patterns of Traffic & Behavior
- Suggestions for Going Further

### Network Topology

The following machines were identified on the network:
<br>

  - ### Kali Attck Machine
    - **Operating System**:
      - Debian Kali 5.4.0
    - **Purpose**:
      The Penetration Tester
    - **IP Address**:
      192.168.1.90

  - ### ELK
    - **Operating System**:
      - Ubuntu 18.04
    - **Purpose**:
      - The ELK (Elasticsearch and Kibana) Stack
    - **IP Address**:
      - 192.168.1.100

  - ### Target 1
    - **Operating System**:
      - Debian GNU/Linux 8
    - **Purpose**:
      - Apache web server: WordPress Host
    - **IP Address**:
      - 192.168.1.110

- ### Target 2
    - **Operating System**:
      - Ubuntu 18.04
    - **Purpose**:
      - Vulnerable Web Server
    - **IP Address**:
      - 192.168.1.105

### Description of Targets

The target of this attack was: `Target 1: 192.168.1.110`

Target 1 is an Apache web server and has SSH enabled, so ports 80 and 22 are possible ports of entry for attackers. As such, the following alerts have been implemented:

### Monitoring the Targets

Traffic to these services should be carefully monitored. To this end, we have implemented the alerts below:

#### HTTP Request Size Monitor

HTTP Request Size Monitor is implemented as follows:
  - **Metric**: 
    - WHEN sum() of http.request.bytes OVER all documents
  - **Threshold**: 
      - IS ABOVE 3500 FOR THE LAST 1 minute 
  - **Vulnerability Mitigated**:
      - DOS attacks (Denial of service), XSS (cross dite scripting), HTTP smuggling attacks and Network scans.
  - **Reliability**:
      - This alert could generate false positives, it has a medium reliability rating. There is potential for a large non malicious HTTP request and large volumes legitimate HTTP traffic.

#### Excessive HTTP Responses
Excessive HTTP Responses is implemented as follows:
  - **Metric**:
    - Excessive HTTP Responses - WHEN count() GROUPED OVER top 5 'http.response.status_code' 
  - **Threshold**: IS ABOVE 400 FOR THE LAST 5 minutes
  - **Vulnerability Mitigated**:
    - Brute force attacks and HTTP Flood DDOS attacks.
  - **Reliability**:
    - This alert can be triggered by any HTTP respones code which means it could regularly generate false positives, it has a low reliability rating. There is potential for large volumes legitimate HTTP traffic to trigger this alert.

#### CPU Usage Monitor
CPU Usage Monitor is implemented as follows:
  - **Metric**: 
    - WHEN max() OF system.process.cpu.total.pct OVER all documents 
  - **Threshold**:
    - IS ABOVE 0.5 FOR THE LAST 5 minutes
  - **Vulnerability Mitigated**: 
    - Detect malware, viruses and other malicious software using CPU resources. 
  - **Reliability**:
    - This alert is not very likely to create false positives, but will detect if there is something running that shouldn't be. Regardless of the reason, malicious or not this alert can also be used to improve CPU usage and resource allocation. 
_

### Suggestions for Going Further

The logs and alerts generated during the assessment suggest that this network is susceptible to several active threats, identified by the alerts above. In addition to watching for occurrences of such threats, the network should be hardened against them. The Blue Team suggests that IT implement the fixes below to protect the network:
- ### Vulnerability 1
  -  WordPress Hardening
  - **Patch**: 
    - Implement regular updates and patches to WordPress.  
    - Install security plugins.
    - Disable unused WordPress features and settings.
    - Ensuring that permissions and sensitive files are congigured correctly and sensitive data is approriately encrypted/protected.
  - **Why It Works**:
    - Regular updates to WordPress ensure that you have the latest security patches. this makes you less likely to fall victim to an old exploit. WordPress plugins including security plugins add functionality to your WordPress site and protect from malware, brute force attacks, and hacking attempts.
  <br>
- ### Vulnerability 2
  - Code Injection Hardening/DDOS Hardening
  - **Patch**: 
    - Controlling and validating user input. The validation process is aimed at verifying if the type of input submitted by a user is s the accepted type, length, and format allowed. 
    - Parameterized queries, user input is automatically quoted meaning the input will not cause the change of the intent.
    - Applying and maintaining security updates and patches to your to servers.
  - **Why It Works**: 
    - Limiting input by users via input validation helps to stop therat actors adding scripts or commands in to the web server or an application via HTTP request.  
  <br>
- ### Vulnerability 3
  - Virus or Malware hardening
  - **Patch**:
    - Impletement antivirus software or update and maintain currently installed antivirus software.
    - Implement and configure an Intrusion Detection System (IDS).
  
  - **Why It Works**: 
    - Antivirus software inspects all the files that enter your system. All those files are scanned to check for any peculiarity or anything malicious.
    - An Intrusion Detection System (IDS) is a monitoring system that detects suspicious activities and generates alerts when they are detected. IDS's use either Signature or anomaly Detection to scan incoming traffic. 
 
  - ### Vulnerability 4
  - Brute Force Attacks
  - **Patch**
    - Strong password rules.
    - Mutifactor authentifacation (MFA).
    - Incremental lockouts on failed attempts.
  - **Why It Works**
    Having the appropriate controls (strong rules and MFA) on poasswords makes brute force attack less likely to be successfull, and incremental lockouts prevent a password from being entered incorrectly too mant times but locking the account for longer amounts of time each failed attempt. 
