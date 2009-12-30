/*
 * Generated by asn1c-0.9.21 (http://lionet.info/asn1c)
 * From ASN.1 module "FEF-IntermediateDraft"
 * 	found in "../annexb-snacc-122001.asn1"
 */

#ifndef	_FilterType_H_
#define	_FilterType_H_


#include <asn_application.h>

/* Including external dependencies */
#include <INTEGER.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum FilterType {
	FilterType_other	= 0,
	FilterType_lowpass	= 1,
	FilterType_highpass	= 2,
	FilterType_notch	= 3
} e_FilterType;

/* FilterType */
typedef INTEGER_t	 FilterType_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_FilterType;
asn_struct_free_f FilterType_free;
asn_struct_print_f FilterType_print;
asn_constr_check_f FilterType_constraint;
ber_type_decoder_f FilterType_decode_ber;
der_type_encoder_f FilterType_encode_der;
xer_type_decoder_f FilterType_decode_xer;
xer_type_encoder_f FilterType_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _FilterType_H_ */
