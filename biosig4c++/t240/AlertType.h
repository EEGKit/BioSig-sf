/*
 * Generated by asn1c-0.9.21 (http://lionet.info/asn1c)
 * From ASN.1 module "FEF-IntermediateDraft"
 * 	found in "../annexb-snacc-122001.asn1"
 */

#ifndef	_AlertType_H_
#define	_AlertType_H_


#include <asn_application.h>

/* Including external dependencies */
#include <INTEGER.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum AlertType {
	AlertType_noalert	= 0,
	AlertType_lowprital	= 1,
	AlertType_medprital	= 2,
	AlertType_hiprital	= 4,
	AlertType_lowpripal	= 256,
	AlertType_medpripal	= 512,
	AlertType_hipripal	= 1024
} e_AlertType;

/* AlertType */
typedef INTEGER_t	 AlertType_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_AlertType;
asn_struct_free_f AlertType_free;
asn_struct_print_f AlertType_print;
asn_constr_check_f AlertType_constraint;
ber_type_decoder_f AlertType_decode_ber;
der_type_encoder_f AlertType_encode_der;
xer_type_decoder_f AlertType_decode_xer;
xer_type_encoder_f AlertType_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _AlertType_H_ */
