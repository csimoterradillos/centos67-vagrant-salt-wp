# Add users
{% for user, args in pillar.get('users', {}).iteritems() %}
{{user}}:
  user.present:
    - fullname: {{ args['fullname'] }}
    - shell: {{ args['shell'] }}
    {% if args['sudouser'] %}
    - groups: ['wheel']
  {% endif %}

{{user}}_key:
  ssh_auth.present:
    - user: {{user}}
    - source: salt://ssh/{{user}}.id_rsa.pub

{% endfor %}
