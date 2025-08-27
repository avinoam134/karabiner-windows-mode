// General rules: apply everywhere except hypervisors, IDEs, remote desktops, and terminal emulators

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_hypervisor_ide_remoteDesktop_terminalEmulator = k.condition(
  'unless',
  bundle.hypervisors + bundle.ides + bundle.remoteDesktops + bundle.terminalEmulators + bundle.webBrowsers,
  file_paths.remoteDesktops
);

local unless_hypervisor_ide_remoteDesktop_terminalEmulator_or_Terminal = k.condition(
  'unless',
  bundle.hypervisors + bundle.ides + bundle.remoteDesktops + bundle.terminalEmulators + ['^com\\.apple\\.Terminal$'],
  file_paths.remoteDesktops
);

{
  rules: [
    // Navigation keys
    k.rule('Insert (Ctrl)', k.input('insert', ['control']), k.outputKey('c', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Insert (Shift)', k.input('insert', ['shift']), k.outputKey('v', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    k.rule('Home (Ctrl+Shift)', k.input('home', ['control', 'shift']), k.outputKey('up_arrow', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Home (Shift)', k.input('home', ['shift']), k.outputKey('left_arrow', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Home (Ctrl)', k.input('home', ['control']), k.outputKey('up_arrow', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Home', k.input('home'), k.outputKey('left_arrow', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    k.rule('End (Ctrl+Shift)', k.input('end', ['control', 'shift']), k.outputKey('down_arrow', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End (Shift)', k.input('end', ['shift']), k.outputKey('right_arrow', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End (Ctrl)', k.input('end', ['control']), k.outputKey('down_arrow', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End', k.input('end'), k.outputKey('right_arrow', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    k.rule('Left Arrow (Ctrl)', k.input('left_arrow', ['control']), k.outputKey('left_arrow', ['option']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Left Arrow (Ctrl+Shift)', k.input('left_arrow', ['control', 'shift']), k.outputKey('left_arrow', ['option', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Right Arrow (Ctrl)', k.input('right_arrow', ['control']), k.outputKey('right_arrow', ['option']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Right Arrow (Ctrl+Shift)', k.input('right_arrow', ['control', 'shift']), k.outputKey('right_arrow', ['option', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // Command keys
    k.rule('Backspace (Ctrl)', k.input('delete_or_backspace', ['control']), k.outputKey('delete_or_backspace', ['option']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Delete (Ctrl)', k.input('delete_forward', ['control']), k.outputKey('delete_forward', ['option']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Enter (Ctrl)', k.input('return_or_enter', ['control']), k.outputKey('return_or_enter', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Enter (Ctrl+Shift)', k.input('return_or_enter', ['control', 'shift']), k.outputKey('return_or_enter', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // Alphanumeric keys (general)
    k.rule('A (Ctrl)', k.input('a', ['control']), k.outputKey('a', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('B (Ctrl)', k.input('b', ['control']), k.outputKey('b', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('F (Ctrl)', k.input('f', ['control']), k.outputKey('f', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('I (Ctrl)', k.input('i', ['control']), k.outputKey('i', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('N (Ctrl)', k.input('n', ['control']), k.outputKey('n', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('O (Ctrl)', k.input('o', ['control']), k.outputKey('o', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('P (Ctrl)', k.input('p', ['control']), k.outputKey('p', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('R (Ctrl)', k.input('r', ['control']), k.outputKey('r', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('S (Ctrl)', k.input('s', ['control']), k.outputKey('s', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('T (Ctrl)', k.input('t', ['control']), k.outputKey('t', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('U (Ctrl)', k.input('u', ['control']), k.outputKey('u', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('W (Ctrl)', k.input('w', ['control']), k.outputKey('w', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('X (Ctrl)', k.input('x', ['control']), k.outputKey('x', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Y (Ctrl)', k.input('y', ['control']), k.outputKey('y', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Z (Ctrl)', k.input('z', ['control']), k.outputKey('z', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // C/V general mappings (exclude Terminal explicitly)
    k.rule('C (Ctrl)', k.input('c', ['left_control']), k.outputKey('c', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator_or_Terminal),
    k.rule('V (Ctrl)', k.input('v', ['control']), k.outputKey('v', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator_or_Terminal),

    // Punctuation / function
    k.rule('Space (Ctrl)', k.input('spacebar', ['control']), k.outputKey('spacebar', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('F1', k.input('f1'), k.outputKey('slash', ['command', 'shift']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('F3', k.input('f3'), k.outputKey('g', ['command']), unless_hypervisor_ide_remoteDesktop_terminalEmulator),
  ],
}


