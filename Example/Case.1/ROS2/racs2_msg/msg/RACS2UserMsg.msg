#
# User data format for ROS2 app in using RACS2 Bridge
#
# --- Header data ---
# This isn't going to work. The cFS Header is a CCSDS packet (6 bytes total)
# 2 bytes for the MID, 2 bytes for Sequence, 2 bytes for total packet length - 7
# If you don't specify the length cFS will truncate your message.
# Also CCSD Sheaders are big endian
uint8[2] cfs_message_id    # Message ID of cFS desitnation app
uint8[2] sequence          # Used if there are multiple related messages
uint8[2] length            # total message length - 7
uint32 body_data_length  # Body data size in byte
# --- Body data (serializied data is preffered): array of byte --- 
# Note: 
#   - In Python: "byte" means bytes object
#   - In C++   : "byte" means uint8_t type
byte[] body_data        