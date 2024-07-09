/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/listener/v3/api_listener.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_CONFIG_LISTENER_V3_API_LISTENER_PROTO_UPB_H_
#define ENVOY_CONFIG_LISTENER_V3_API_LISTENER_PROTO_UPB_H_

#include "upb/generated_code_support.h"

#include "envoy/config/listener/v3/api_listener.upb_minitable.h"

#include "google/protobuf/any.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct envoy_config_listener_v3_ApiListener envoy_config_listener_v3_ApiListener;
struct google_protobuf_Any;



/* envoy.config.listener.v3.ApiListener */

UPB_INLINE envoy_config_listener_v3_ApiListener* envoy_config_listener_v3_ApiListener_new(upb_Arena* arena) {
  return (envoy_config_listener_v3_ApiListener*)_upb_Message_New(&envoy__config__listener__v3__ApiListener_msg_init, arena);
}
UPB_INLINE envoy_config_listener_v3_ApiListener* envoy_config_listener_v3_ApiListener_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_listener_v3_ApiListener* ret = envoy_config_listener_v3_ApiListener_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__config__listener__v3__ApiListener_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_listener_v3_ApiListener* envoy_config_listener_v3_ApiListener_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_listener_v3_ApiListener* ret = envoy_config_listener_v3_ApiListener_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__config__listener__v3__ApiListener_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_listener_v3_ApiListener_serialize(const envoy_config_listener_v3_ApiListener* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__config__listener__v3__ApiListener_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_listener_v3_ApiListener_serialize_ex(const envoy_config_listener_v3_ApiListener* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__config__listener__v3__ApiListener_msg_init, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_config_listener_v3_ApiListener_clear_api_listener(envoy_config_listener_v3_ApiListener* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), 1, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE const struct google_protobuf_Any* envoy_config_listener_v3_ApiListener_api_listener(const envoy_config_listener_v3_ApiListener* msg) {
  const struct google_protobuf_Any* default_val = NULL;
  const struct google_protobuf_Any* ret;
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), 1, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE bool envoy_config_listener_v3_ApiListener_has_api_listener(const envoy_config_listener_v3_ApiListener* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), 1, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  return _upb_Message_HasNonExtensionField(msg, &field);
}

UPB_INLINE void envoy_config_listener_v3_ApiListener_set_api_listener(envoy_config_listener_v3_ApiListener *msg, struct google_protobuf_Any* value) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), 1, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE struct google_protobuf_Any* envoy_config_listener_v3_ApiListener_mutable_api_listener(envoy_config_listener_v3_ApiListener* msg, upb_Arena* arena) {
  struct google_protobuf_Any* sub = (struct google_protobuf_Any*)envoy_config_listener_v3_ApiListener_api_listener(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_Any*)_upb_Message_New(&google__protobuf__Any_msg_init, arena);
    if (sub) envoy_config_listener_v3_ApiListener_set_api_listener(msg, sub);
  }
  return sub;
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* ENVOY_CONFIG_LISTENER_V3_API_LISTENER_PROTO_UPB_H_ */
