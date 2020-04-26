control 'docker-checks-1.1' do
  impact 0.7 # High Impact
  tag "nist": ['CM-6', 'Rev_4']
  title 'Verify Docker Container exists and is running'

  describe docker_container(name: 'magiceightball') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq '192.168.0.201:5000/nemonik/magiceightball' }
    its('ports') { should eq '0.0.0.0:5000->5000/tcp' }
    its('command') { should eq 'python magiceightball.py' }
  end
end

