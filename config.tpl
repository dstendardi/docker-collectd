
LoadPlugin "write_graphite"
<Plugin "write_graphite">
  <Carbon>
    Host "{{CarbonHost}}"
    Port "{{CarbonPort}}"
    Prefix "collectd"
  </Carbon>
</Plugin>

LoadPlugin "table"
{{#Memory}}
<Plugin "table">
  <Table "/cgroup/memory/docker/{{Id}}/memory.stat">
    Instance "{{Instance}}"
    Separator " \\n"
    <Result>
      Type gauge
      InstancesFrom 0
      ValuesFrom 1
    </Result>
  </Table>
</Plugin>
{{/Memory}}
