{
  //-----------//
  // FUNCTIONS //
  //-----------//

  // rule
  //
  // description (string, required)
  //   description of a rule, should be '<key> (<modifier1>+...+<modifierN>) [<specialNotes>]'
  //
  // input (object, required)
  //   input object for a rule; use input()
  //
  // output (object or array, required)
  //   output object for a rule; use outputKey() or outputShell()
  //
  // condition (object, optional)
  //   condition for a trigger; use condition()
  rule(description, input, output, condition=null):: {
    description: description,
    manipulators: [
      {
        from: input,
      } +
      local outs = if std.isArray(output) then output else [output] + [];
      local outsOf(type) = [o.output for o in outs if o.to_type == type];
      {
        [if std.length(outsOf('to')) > 0 then 'to']: outsOf('to'),
        [if std.length(outsOf('to_if_alone')) > 0 then 'to_if_alone']: outsOf('to_if_alone'),
        [if std.length(outsOf('to_if_held_down')) > 0 then 'to_if_held_down']: outsOf('to_if_held_down'),
      } + {
        [if condition != null then 'conditions']: [
          condition,
        ],
        type: 'basic'
      },
    ],
  },

  // input
  //
  // key (string, required)
  //   key that will trigger a rule
  //
  // modifiers (array, optional)
  //   modifiers that, when combined with <key>, trigger a rule
  //
  // key_is_modifier (boolean, optional)
  //   removes entire 'modifiers' object; only use when <key> is a modifier itself
  input(key, modifiers=null, key_is_modifier=false):: {
    key_code: key,
    [if key_is_modifier then null else 'modifiers']: {
      [if modifiers != null then 'mandatory']: modifiers,
      optional: ['any'],
    },
  },

  // inputPointer
  //
  // button (string, required)
  //   pointing button that will trigger a rule (e.g., 'button1')
  //
  // modifiers (array, optional)
  //   modifiers that, when combined with the pointing button, trigger a rule
  inputPointer(button, modifiers=null):: {
    pointing_button: button,
    [if modifiers != null then 'modifiers']: {
      [if modifiers != null then 'mandatory']: modifiers,
      optional: ['any'],
    },
  },

  // outputKey
  //
  // key (string, required)
  //   key to output when a rule is triggered
  //
  // modifiers (array, optional)
  //   modifiers to add to the key when a rule is triggered
  //
  // output_type (string, optional)
  //   type of 'to' object; should normally be left alone
  //
  // key_code (string, optional)
  //   type of output key code; change the default value for non-typical keys, e.g. media keys
  outputKey(key, modifiers=null, output_type='to', key_code='key_code'):: {
    to_type: output_type,
    output: {
      [key_code]: key,
      [if modifiers != null then 'modifiers']: modifiers,
    },
  },

  // outputPointer
  //
  // button (string, required)
  //   pointing button to output when a rule is triggered
  //
  // modifiers (array, optional)
  //   modifiers to add when the pointing button is output
  //
  // output_type (string, optional)
  //   type of 'to' object; should normally be left alone
  outputPointer(button, modifiers=null, output_type='to'):: {
    to_type: output_type,
    output: {
      pointing_button: button,
      [if modifiers != null then 'modifiers']: modifiers,
    },
  },

  // fromKey (for simultaneous)
  fromKey(key):: {
    key_code: key,
  },

  // fromPointer (for simultaneous)
  fromPointer(button):: {
    pointing_button: button,
  },

  // inputSimultaneous
  //
  // inputs (array of fromKey/fromPointer objects)
  // options (object, optional): simultaneous_options
  inputSimultaneous(inputs, options=null):: {
    simultaneous: inputs,
    [if options != null then 'simultaneous_options']: options,
    modifiers: { optional: ['any'] },
  },

  // outputShell
  //
  // command (string, required)
  //   the command to run when a rule is triggered
  outputShell(command):: {
    to_type: 'to',
    output: {
      shell_command: command,
    },
  },

  // outputSetVariable
  // Set a Karabiner variable
  // name (string), value (number)
  outputSetVariable(name, value):: {
    to_type: 'to',
    output: {
      set_variable: { name: name, value: value },
    },
  },

  // condition
  //
  // type (string, required)
  //   the 'frontmost_application' type to use. common values are 'if' or 'unless'
  //
  // bundles (array, required)
  //   bundle identifiers of applications
  //
  // file_paths (array, optional)
  //   file path identifiers of applications
  condition(type, bundles, file_paths=null):: {
    type: 'frontmost_application_' + type,
    bundle_identifiers: bundles,
    [if file_paths != null then 'file_paths']: file_paths,
  },

  // variable conditions
  variableIf(name, value):: {
    type: 'variable_if',
    name: name,
    value: value,
  },
  variableUnless(name, value):: {
    type: 'variable_unless',
    name: name,
    value: value,
  },

  // runDockedApp
  //
  // number (string, required)
  //   the number of the docked app to run (zero-indexed)
  //   note that the list of apps does not include Finder, which is permanently
  //   pinned to the dock as the first item
  runDockedApp(number):: {
    to_type: 'to',
    output: {
      shell_command: "open -b $(/usr/libexec/PlistBuddy -c 'print :persistent-apps:" + number + ":tile-data:bundle-identifier' ~/Library/Preferences/com.apple.dock.plist)",
    },
  },
}
