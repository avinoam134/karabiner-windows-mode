// Copied from v1 with safe 'to' merging
{
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

  input(key, modifiers=null, key_is_modifier=false):: {
    key_code: key,
    [if key_is_modifier then null else 'modifiers']: {
      [if modifiers != null then 'mandatory']: modifiers,
      optional: ['any'],
    },
  },

  inputPointer(button, modifiers=null):: {
    pointing_button: button,
    [if modifiers != null then 'modifiers']: {
      [if modifiers != null then 'mandatory']: modifiers,
      optional: ['any'],
    },
  },

  outputKey(key, modifiers=null, output_type='to', key_code='key_code'):: {
    to_type: output_type,
    output: {
      [key_code]: key,
      [if modifiers != null then 'modifiers']: modifiers,
    },
  },

  outputPointer(button, modifiers=null, output_type='to'):: {
    to_type: output_type,
    output: {
      pointing_button: button,
      [if modifiers != null then 'modifiers']: modifiers,
    },
  },

  fromKey(key):: { key_code: key },
  fromPointer(button):: { pointing_button: button },

  inputSimultaneous(inputs, options=null):: {
    simultaneous: inputs,
    [if options != null then 'simultaneous_options']: options,
    modifiers: { optional: ['any'] },
  },

  outputShell(command):: {
    to_type: 'to',
    output: { shell_command: command },
  },

  outputSetVariable(name, value):: {
    to_type: 'to',
    output: { set_variable: { name: name, value: value } },
  },

  condition(type, bundles, file_paths=null):: {
    type: 'frontmost_application_' + type,
    bundle_identifiers: bundles,
    [if file_paths != null then 'file_paths']: file_paths,
  },

  // runDockedApp helper
  runDockedApp(number):: {
    to_type: 'to',
    output: {
      shell_command: "open -b $(/usr/libexec/PlistBuddy -c 'print :persistent-apps:" + number + ":tile-data:bundle-identifier' ~/Library/Preferences/com.apple.dock.plist)",
    },
  },
}


