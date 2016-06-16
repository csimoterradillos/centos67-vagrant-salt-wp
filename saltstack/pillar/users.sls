users:
  monitoring:
    home: /home/monitoring
    createhome: True
    shell: /bin/bash
    groups:
      - wheel
    sudouser: True
    sudo_defaults:
      - '!requiretty'
    ssh_key_type: rsa
    ssh_auth_sources:
      - salt://keys/monitoring.id_rsa.pub
