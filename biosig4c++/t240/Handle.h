/*
 * Generated by asn1c-0.9.21 (http://lionet.info/asn1c)
 * From ASN.1 module "FEF-IntermediateDraft"
 * 	found in "../annexb-snacc-122001.asn1"
 */

#ifndef	_Handle_H_
#define	_Handle_H_


#include <asn_application.h>

/* Including external dependencies */
#include <INTEGER.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Handle */
typedef INTEGER_t	 Handle_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_Handle;
asn_struct_free_f Handle_free;
asn_struct_print_f Handle_print;
asn_constr_check_f Handle_constraint;
ber_type_decoder_f Handle_decode_ber;
der_type_encoder_f Handle_encode_der;
xer_type_decoder_f Handle_decode_xer;
xer_type_encoder_f Handle_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _Handle_H_ */
