/*
 * Generated by asn1c-0.9.21 (http://lionet.info/asn1c)
 * From ASN.1 module "FEF-IntermediateDraft"
 * 	found in "../annexb-snacc-122001.asn1"
 */

#ifndef	_SystemSpecEntry_H_
#define	_SystemSpecEntry_H_


#include <asn_application.h>

/* Including external dependencies */
#include "PrivateCode.h"
#include <ANY.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* SystemSpecEntry */
typedef struct SystemSpecEntry {
	PrivateCode_t	 component_capab_id;
	ANY_t	 component_spec;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SystemSpecEntry_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SystemSpecEntry;

#ifdef __cplusplus
}
#endif

#endif	/* _SystemSpecEntry_H_ */
