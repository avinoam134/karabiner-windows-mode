// v2 bundler (assumes Control→Command globally)

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local rules_general = import 'rules_general.jsonnet';
local rules_terminals = import 'rules_terminals.jsonnet';
local rules_browsers = import 'rules_browsers.jsonnet';
local rules_ides = import 'rules_ides.jsonnet';

local unless_remoteDesktop_hypervisor = k.condition('unless', bundle.hypervisors + bundle.remoteDesktops, file_paths.remoteDesktops);

{
  title: 'Windows Shortcuts v2 (Ctrl→Cmd assumed)',
  rules:
    rules_general.rules
    + rules_terminals.rules
    + rules_browsers.rules
    + rules_ides.rules
    + [
      // Spotlight and lock/sleep
      k.rule('Win [Open Spotlight] [Always]', k.input('left_command', key_is_modifier=true), [k.outputKey('left_command', output_type='to'), k.outputKey('spotlight', output_type='to_if_alone', key_code='apple_vendor_keyboard_key_code')]),
      k.rule('L (Win) [Lock Screen] [Always]', k.input('l', ['command']), k.outputKey('q', ['control', 'command'])),
      k.rule('L (Win) [Sleep] [Always]', k.input('l', ['command']), k.outputKey('power', ['control', 'shift'])),
      // Language switch: both orders, both sides (left/right)
      k.rule('Shift (with Cmd) [Switch input source if alone] [Always]', k.input('left_shift', ['command']), [k.outputKey('left_shift', output_type='to'), k.outputKey('spacebar', ['control'], output_type='to_if_alone')]),
      k.rule('Shift (with Cmd) [Right Shift] [Switch input source if alone] [Always]', k.input('right_shift', ['command']), [k.outputKey('right_shift', output_type='to'), k.outputKey('spacebar', ['control'], output_type='to_if_alone')]),
      k.rule('Cmd (with Shift) [Switch input source if alone] [Always]', k.input('left_command', ['shift']), [k.outputKey('left_command', output_type='to'), k.outputKey('spacebar', ['control'], output_type='to_if_alone')]),
      k.rule('Cmd (with Shift) [Right Cmd] [Switch input source if alone] [Always]', k.input('right_command', ['shift']), [k.outputKey('right_command', output_type='to'), k.outputKey('spacebar', ['control'], output_type='to_if_alone')]),

      // Dock app switching
      k.rule('1 (Cmd) [Open first pinned Dock app (Finder); +IDEs and Terminal Emulators]', k.input('1', ['command']), k.outputShell('open -b com.apple.finder'), unless_remoteDesktop_hypervisor),
      k.rule('2 (Cmd) [Open second pinned Dock app; +IDEs and Terminal Emulators]', k.input('2', ['command']), k.runDockedApp('0'), unless_remoteDesktop_hypervisor),
      k.rule('3 (Cmd) [Open third pinned Dock app; +IDEs and Terminal Emulators]', k.input('3', ['command']), k.runDockedApp('1'), unless_remoteDesktop_hypervisor),
      k.rule('4 (Cmd) [Open fourth pinned Dock app; +IDEs and Terminal Emulators]', k.input('4', ['command']), k.runDockedApp('2'), unless_remoteDesktop_hypervisor),
      k.rule('5 (Cmd) [Open fifth pinned Dock app; +IDEs and Terminal Emulators]', k.input('5', ['command']), k.runDockedApp('3'), unless_remoteDesktop_hypervisor),
      k.rule('6 (Cmd) [Open sixth pinned Dock app; +IDEs and Terminal Emulators]', k.input('6', ['command']), k.runDockedApp('4'), unless_remoteDesktop_hypervisor),
      k.rule('7 (Cmd) [Open seventh pinned Dock app; +IDEs and Terminal Emulators]', k.input('7', ['command']), k.runDockedApp('5'), unless_remoteDesktop_hypervisor),
      k.rule('8 (Cmd) [Open eighth pinned Dock app; +IDEs and Terminal Emulators]', k.input('8', ['command']), k.runDockedApp('6'), unless_remoteDesktop_hypervisor),
      k.rule('9 (Cmd) [Open ninth pinned Dock app; +IDEs and Terminal Emulators]', k.input('9', ['command']), k.runDockedApp('7'), unless_remoteDesktop_hypervisor),
    ],
}


