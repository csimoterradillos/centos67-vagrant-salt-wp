system:
  network.system:
    - enabled: True
    - hostname: prueba.com
    - gateway: 10.0.2.2
    - gatewaydev: eth0

eth0:
  network.managed:
    - enabled: True
    - type: eth
    - proto: dhcp
    - ipaddr: 10.0.2.15
    - netmask: 255.255.255.0
    - dns:
      - 8.8.8.8
      - 8.8.4.4
