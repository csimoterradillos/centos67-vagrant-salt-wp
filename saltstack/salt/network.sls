system:
  network.system:
    - enabled: True
    - hostname: prueba.com
    - gateway: 192.168.0.1
    - gatewaydev: eth0

eth0:
  network.managed:
    - enabled: True
    - type: eth
    - proto: dhcp
    - ipaddr: 192.168.0.10
    - netmask: 255.255.255.0
    - dns:
      - 8.8.8.8
      - 8.8.4.4
