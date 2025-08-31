// v2 general rules, assuming physical Control already emits Command

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_excepted = k.condition('unless', bundle.hypervisors + bundle.remoteDesktops + bundle.terminalEmulators, file_paths.remoteDesktops);
local unless_excepted_ide = k.condition('unless', bundle.hypervisors + bundle.remoteDesktops + bundle.terminalEmulators + bundle.ides, file_paths.remoteDesktops);

{
  rules: [
    // Common Windows-like Ctrl shortcuts -> Command (excluded in terminals)
    k.rule('A (Ctrl)', k.input('a', ['control']), k.outputKey('a', ['command']), unless_excepted),
    k.rule('C (Ctrl)', k.input('c', ['control']), k.outputKey('c', ['command']), unless_excepted),
    k.rule('V (Ctrl)', k.input('v', ['control']), k.outputKey('v', ['command']), unless_excepted),
    k.rule('X (Ctrl)', k.input('x', ['control']), k.outputKey('x', ['command']), unless_excepted),
    k.rule('Z (Ctrl)', k.input('z', ['control']), k.outputKey('z', ['command']), unless_excepted),
    k.rule('Y (Ctrl)', k.input('y', ['control']), k.outputKey('y', ['command']), unless_excepted),
    k.rule('S (Ctrl)', k.input('s', ['control']), k.outputKey('s', ['command']), unless_excepted),
    k.rule('W (Ctrl)', k.input('w', ['control']), k.outputKey('w', ['command']), unless_excepted),
    k.rule('N (Ctrl)', k.input('n', ['control']), k.outputKey('n', ['command']), unless_excepted),
    k.rule('O (Ctrl)', k.input('o', ['control']), k.outputKey('o', ['command']), unless_excepted),
    k.rule('P (Ctrl)', k.input('p', ['control']), k.outputKey('p', ['command']), unless_excepted),
    k.rule('F (Ctrl)', k.input('f', ['control']), k.outputKey('f', ['command']), unless_excepted),
    k.rule('T (Ctrl)', k.input('t', ['control']), k.outputKey('t', ['command']), unless_excepted),

    // Home/End like Windows
    k.rule('Home', k.input('home'), k.outputKey('left_arrow', ['command']), unless_excepted),
    k.rule('Home (Ctrl)', k.input('home', ['control']), k.outputKey('up_arrow', ['command']), unless_excepted),
    k.rule('Home (Shift)', k.input('home', ['shift']), k.outputKey('left_arrow', ['command', 'shift']), unless_excepted),
    k.rule('Home (Ctrl+Shift)', k.input('home', ['control', 'shift']), k.outputKey('up_arrow', ['command', 'shift']), unless_excepted),
    k.rule('End', k.input('end'), k.outputKey('right_arrow', ['command']), unless_excepted),
    k.rule('End (Ctrl)', k.input('end', ['control']), k.outputKey('down_arrow', ['command']), unless_excepted),
    k.rule('End (Shift)', k.input('end', ['shift']), k.outputKey('right_arrow', ['command', 'shift']), unless_excepted),
    k.rule('End (Ctrl+Shift)', k.input('end', ['control', 'shift']), k.outputKey('down_arrow', ['command', 'shift']), unless_excepted),

    // Word navigation (Windows Ctrl+Arrow maps to mac Option+Arrow) - exclude IDEs to avoid conflicts with integrated terminals
    k.rule('Left Arrow (Ctrl)', k.input('left_arrow', ['control']), k.outputKey('left_arrow', ['option']), unless_excepted_ide),
    k.rule('Left Arrow (Ctrl+Shift)', k.input('left_arrow', ['control', 'shift']), k.outputKey('left_arrow', ['option', 'shift']), unless_excepted_ide),
    k.rule('Right Arrow (Ctrl)', k.input('right_arrow', ['control']), k.outputKey('right_arrow', ['option']), unless_excepted_ide),
    k.rule('Right Arrow (Ctrl+Shift)', k.input('right_arrow', ['control', 'shift']), k.outputKey('right_arrow', ['option', 'shift']), unless_excepted_ide),

    // Deletion - exclude IDEs to avoid conflicts with integrated terminals
    k.rule('Backspace (Ctrl)', k.input('delete_or_backspace', ['control']), k.outputKey('delete_or_backspace', ['option']), unless_excepted_ide),
    k.rule('Delete (Ctrl)', k.input('delete_forward', ['control']), k.outputKey('delete_forward', ['option']), unless_excepted_ide),

    // Function keys kept
    k.rule('F1', k.input('f1'), k.outputKey('slash', ['command', 'shift']), unless_excepted),
    k.rule('F3', k.input('f3'), k.outputKey('g', ['command']), unless_excepted),
  ],
}


