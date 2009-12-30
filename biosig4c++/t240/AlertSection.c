/*
 * Generated by asn1c-0.9.21 (http://lionet.info/asn1c)
 * From ASN.1 module "FEF-IntermediateDraft"
 * 	found in "../annexb-snacc-122001.asn1"
 */

#include <asn_internal.h>

#include "AlertSection.h"

static asn_TYPE_member_t asn_MBR_AlertSection_1[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct AlertSection, handle),
		(ASN_TAG_CLASS_APPLICATION | (2337 << 2)),
		0,
		&asn_DEF_Handle,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"handle"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct AlertSection, alerttype),
		(ASN_TAG_CLASS_APPLICATION | (2351 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_AlertCode,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"alerttype"
		},
	{ ATF_POINTER, 1, offsetof(struct AlertSection, labelstring),
		(ASN_TAG_CLASS_APPLICATION | (2343 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_FEFString,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"labelstring"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct AlertSection, timestamp),
		(ASN_TAG_CLASS_UNIVERSAL | (16 << 2)),
		0,
		&asn_DEF_ObservationTime,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"timestamp"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct AlertSection, alertcondition),
		(ASN_TAG_CLASS_APPLICATION | (2476 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_AlertCondition,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"alertcondition"
		},
	{ ATF_POINTER, 2, offsetof(struct AlertSection, limitspec),
		(ASN_TAG_CLASS_APPLICATION | (2477 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_LimitSpecEntry,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"limitspec"
		},
	{ ATF_POINTER, 1, offsetof(struct AlertSection, vmoreference),
		(ASN_TAG_CLASS_APPLICATION | (6045 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_HandleRef,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"vmoreference"
		},
};
static ber_tlv_tag_t asn_DEF_AlertSection_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_AlertSection_tag2el_1[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (16 << 2)), 3, 0, 0 }, /* timestamp at 1387 */
    { (ASN_TAG_CLASS_APPLICATION | (2337 << 2)), 0, 0, 0 }, /* handle at 1378 */
    { (ASN_TAG_CLASS_APPLICATION | (2343 << 2)), 2, 0, 0 }, /* labelstring at 1384 */
    { (ASN_TAG_CLASS_APPLICATION | (2351 << 2)), 1, 0, 0 }, /* alerttype at 1381 */
    { (ASN_TAG_CLASS_APPLICATION | (2476 << 2)), 4, 0, 0 }, /* alertcondition at 1390 */
    { (ASN_TAG_CLASS_APPLICATION | (2477 << 2)), 5, 0, 0 }, /* limitspec at 1392 */
    { (ASN_TAG_CLASS_APPLICATION | (6045 << 2)), 6, 0, 0 } /* vmoreference at 1395 */
};
static asn_SEQUENCE_specifics_t asn_SPC_AlertSection_specs_1 = {
	sizeof(struct AlertSection),
	offsetof(struct AlertSection, _asn_ctx),
	asn_MAP_AlertSection_tag2el_1,
	7,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_AlertSection = {
	"AlertSection",
	"AlertSection",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_AlertSection_tags_1,
	sizeof(asn_DEF_AlertSection_tags_1)
		/sizeof(asn_DEF_AlertSection_tags_1[0]), /* 1 */
	asn_DEF_AlertSection_tags_1,	/* Same as above */
	sizeof(asn_DEF_AlertSection_tags_1)
		/sizeof(asn_DEF_AlertSection_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_AlertSection_1,
	7,	/* Elements count */
	&asn_SPC_AlertSection_specs_1	/* Additional specs */
};

