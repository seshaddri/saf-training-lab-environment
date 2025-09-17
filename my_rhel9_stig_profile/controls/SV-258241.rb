control 'SV-258241' do
  title 'RHEL 9 must implement a systemwide encryption policy.'
  desc 'Centralized cryptographic policies simplify applying secure ciphers across an operating system and the applications that run on that operating system. Use of weak or untested encryption algorithms undermines the purposes of utilizing encryption to protect data.

'
  desc 'check', 'Show the configured systemwide cryptographic policy by running the following command:

$ sudo update-crypto-policies --show
FIPS

If the main policy name is not "FIPS", this is a finding.

If the AD-SUPPORT subpolicy module is included (e.g., "FIPS:AD-SUPPORT"), and Active Directory support is not documented as an operational requirement with the information system security officer (ISSO), this is a finding.

If the NO-ENFORCE-EMS subpolicy module is included (e.g., "FIPS:NO-ENFORCE-EMS"), and not enforcing EMS is not documented as an operational requirement with the ISSO, this is a finding.

If any other subpolicy module is included, this is a finding.'
  desc 'fix', 'Configure the FIPS policy as the systemwide cryptographic policy by running the following command:

$ sudo update-crypto-policies --set FIPS

Reboot the system to ensure that all aspects of the change take effect.'
  impact 0.5
  tag check_id: 'C-61982r1017570_chk'
  tag severity: 'medium'
  tag gid: 'V-258241'
  tag rid: 'SV-258241r1017572_rule'
  tag stig_id: 'RHEL-09-672045'
  tag gtitle: 'SRG-OS-000396-GPOS-00176'
  tag fix_id: 'F-61906r1017571_fix'
  tag satisfies: ['SRG-OS-000396-GPOS-00176', 'SRG-OS-000393-GPOS-00173', 'SRG-OS-000394-GPOS-00174']
  tag 'documentable'
  tag cci: ['CCI-002450', 'CCI-002890', 'CCI-003123']
  tag nist: ['SC-13 b', 'MA-4 (6)', 'MA-4 (6)']
end
