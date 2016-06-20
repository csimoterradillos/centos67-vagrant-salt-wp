users:
  monitoring:
    fullname: 'Usuario monitoring para pruebas'
    group_name: 'monitoring'
    home: /home/monitoring
    createhome: True
    shell: /bin/bash
    groups:
      - wheel
    sudouser: True
    ssh_key_type: rsa
    ssh_auth_sources:
      - salt://monitoring.id_rsa.pub
