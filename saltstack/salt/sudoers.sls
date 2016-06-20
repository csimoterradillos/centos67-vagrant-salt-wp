/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 400
    - source: salt://sudoers/sudoers.cfg
