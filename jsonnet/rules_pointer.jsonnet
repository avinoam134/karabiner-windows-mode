// Pointer-specific rules for Ctrl-held operations

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_remoteDesktop_hypervisor_terminal = k.condition(
  'unless',
  bundle.hypervisors + bundle.remoteDesktops + bundle.terminalEmulators,
  file_paths.remoteDesktops
);

{
  rules: [
    // Ctrl+Click -> Cmd+Click (multi-select, follow link) in general apps, IDEs, browsers
    k.rule('Button1 (Ctrl) [Pointer mapping]', k.inputPointer('button1', ['control']), k.outputPointer('button1', ['command']), unless_remoteDesktop_hypervisor_terminal),
    // Ctrl+Shift+Click -> Cmd+Shift+Click (range selection variants)
    k.rule('Button1 (Ctrl+Shift) [Pointer mapping]', k.inputPointer('button1', ['control', 'shift']), k.outputPointer('button1', ['command', 'shift']), unless_remoteDesktop_hypervisor_terminal),
  ],
}


