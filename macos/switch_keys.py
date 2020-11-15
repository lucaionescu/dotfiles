"""
Creates hdiutil commmand for switching keyboard keys.

https://apple.stackexchange.com/questions/283252/how-do-i-remap-a-key-in-macos-sierra-e-g-right-alt-to-right-control
https://developer.apple.com/library/archive/technotes/tn2450/_index.html
"""

def convert(val):
    int_val = int(val, 16)
    int_ref = 0x700000000
    return hex(int_ref | int_val)

key_usage_id_1 = '0x29'  # esc key
key_usage_id_2 = '0x39'  # caps lock

key_usage_id_1_hex = convert(key_usage_id_1)
key_usage_id_2_hex = convert(key_usage_id_2)

command = f"""
hidutil property --set '{{"UserKeyMapping":
    [{{"HIDKeyboardModifierMappingSrc":{key_usage_id_1_hex},
      "HIDKeyboardModifierMappingDst":{key_usage_id_2_hex}}},
     {{"HIDKeyboardModifierMappingSrc":{key_usage_id_2_hex},
      "HIDKeyboardModifierMappingDst":{key_usage_id_1_hex}}}]
}}'
"""

print(command)

