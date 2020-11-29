#
#    Copyright (C) 2020 Alois Schloegl <alois.schloegl@gmail.com>
#    This file is part of the "BioSig for C/C++" repository
#    (biosig4c++/libbiosig) at http://biosig.sf.net/
#
#    This program is free software; you can redistribute it and/or
#    modify it under the terms of the GNU General Public License
#    as published by the Free Software Foundation; either version 3
#    of the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


# References
#   https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/connections
#   https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/seek
#   https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/readBin
#   https://arxiv.org/abs/cs/0608052

setClass(
	"HeaderType",
	slots = list(
		# H1
		VersionID   = "numeric",
		# HeadLen     = "numeric",
		EventTablePos = "numeric",	
		NS          = "numeric",	# number of signals (i.e. channels)
		NRec        = "numeric",	# number of records (i.e. blocks)
		Dur         = "numeric",	# duration of a record
		SampleRate  = "numeric",	# sampling rate = SPR/Dur
		SPR         = "numeric",	# samples per record
		BPB         = "numeric",	# bytes per block
		# H2
		Label       = "character",	# channel label
		Transducer  = "character",	# transducer
		PhysDimCode = "numeric",	# physical encoding
		PhysMin     = "numeric",	# physical minimum
		PhysMax     = "numeric",	# physical maximum
		DigMin      = "numeric",	# digital minimum
		DigMax      = "numeric",	# digital maximum
		Toffset     = "numeric",	# time offset of each channel
		LowPass     = "numeric",	# lowpass filter
		HighPass    = "numeric",	# highpass filter
		Notch       = "numeric",	# notch filter
		spr         = "numeric",	# samples per record in each channel
		GDFTYP      = "numeric",
		# H3
		# EventTable
		# data
		data = "matrix"
	)
 );

GDFTYPE_BITS=as.integer(c(
	8, 8, 8,16,16,32,32,64,64,32,64, 0, 0, 0, 0, 0,
	32,64,128,0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	16,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 8, 0,10, 0,12, 0, 0, 0,16,
	0, 0, 0, 0, 0, 0, 0,24, 0, 0, 0, 0, 0, 0, 0,32,
	0, 0, 0, 0, 0, 0, 0,40, 0, 0, 0, 0, 0, 0, 0,48,
	0, 0, 0, 0, 0, 0, 0,56, 0, 0, 0, 0, 0, 0, 0,64,
	0, 0, 0, 0, 0, 0, 0,72, 0, 0, 0, 0, 0, 0, 0,80,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 8, 0,10, 0,12, 0, 0, 0,16,
	0, 0, 0, 0, 0, 0, 0,24, 0, 0, 0, 0, 0, 0, 0,32,
	0, 0, 0, 0, 0, 0, 0,40, 0, 0, 0, 0, 0, 0, 0,48,
	0, 0, 0, 0, 0, 0, 0,56, 0, 0, 0, 0, 0, 0, 0,64,
	0, 0, 0, 0, 0, 0, 0,72, 0, 0, 0, 0, 0, 0, 0,80
));


"%gcd%" <- function(u, v) {ifelse(u %% v != 0, v %gcd% (u%%v), v)}
"%lcm%" <- function(u, v) { abs(u*v)/(u %gcd% v)}

#' Loads biomedical signal data in GDF format
#'
#' @param filename name of the gdf data file
#' @param channel indicates which channel should be loaded, (default 0: indicaes all channels)
#' @return HeaderType data HDR
#'     HDR@data  is a matrix containing sample values with HDR@NS columns (i.e. channels)
#'          and HDR@NRec*HDR@SPR rows (sampling time points)
#'     HDR@SampleRate  is the sampling rate
#'     HDR@Label contain the channel labels
loadgdf <- function(filename, chan=0) {
	fid <- file(filename, "rb")
	HDR <- new("HeaderType")
	### read H1 - fixed header ### 
	HDR@VersionID <- readBin(fid, "int", size=1, n=8)
	if (!all(HDR@VersionID[1:4] == c(0x47,0x44,0x46,0x20)))
		stop("This is not a GDF file - convert first to GDF - e.g. with save2gdf command line tool")

	seek(fid, where=184, origin="start")
	HeadLen <- readBin(fid, "int", size=2, signed=FALSE, endian="little")*256

	seek(fid, where=236, origin="start")
	HDR@NRec <- readBin(fid, "int", size=8, endian="little")
	HDR@Dur  <- readBin(fid, "double", n=1, size=8, endian="little")
	HDR@NS   <- readBin(fid, "int", size=2, signed=FALSE, endian="little")
	HDR@SPR  <- 1
	if (any(chan==0)) chan <- c(1:HDR@NS)

	### read H2 - variable header, channel information ### 
	for (k in c(1:HDR@NS)) {
		seek(fid, where=256+16*(k-1), origin="start")
		HDR@Label[k] <- matrix(readBin(fid, "character", size=1))
	}
	for (k in c(1:HDR@NS)) {
		seek(fid, where=256+16*HDR@NS+80*(k-1), origin="start")
		HDR@Transducer[k] <- matrix(readBin(fid, "character", size=1))
	}
	seek(fid, where=256+102*HDR@NS, origin="start")
	HDR@PhysDimCode<- readBin(fid, "int", size=2, n=HDR@NS, endian="little")
	HDR@PhysMin <- readBin(fid, "double", size=8, n=HDR@NS, endian="little")
	HDR@PhysMax <- readBin(fid, "double", size=8, n=HDR@NS, endian="little")
	HDR@DigMin  <- readBin(fid, "double", size=8, n=HDR@NS, endian="little")
	HDR@DigMax  <- readBin(fid, "double", size=8, n=HDR@NS, endian="little")

	seek(fid, where=256+200*HDR@NS, origin="start")
	HDR@Toffset <- readBin(fid, "double", size=4, n=HDR@NS, endian="little")
	HDR@LowPass <- readBin(fid, "double", size=4, n=HDR@NS, endian="little")
	HDR@HighPass<- readBin(fid, "double", size=4, n=HDR@NS, endian="little")
	HDR@Notch   <- readBin(fid, "double", size=4, n=HDR@NS, endian="little")
	HDR@spr     <- readBin(fid, "int",    size=4, n=HDR@NS, endian="little")
	for (v in unique(HDR@spr(chan))) HDR@SPR <- (HDR@SPR %lcm% v)
	HDR@SampleRate <- HDR@SPR / HDR@Dur

	HDR@GDFTYP  <- readBin(fid, "int", size=4, n=HDR@NS, endian="little")
	HDR@BPB     <-     sum(GDFTYPE_BITS[HDR@GDFTYP+1] * HDR@spr)/8
	bi          <- c(0, cumsum(ceiling(GDFTYPE_BITS[HDR@GDFTYP+1]/8) * HDR@spr))
	spb         <- c(0, cumsum(HDR@spr))

	Cal <- (HDR@PhysMax - HDR@PhysMin) / (HDR@DigMax - HDR@DigMin)
	Off <-  HDR@PhysMin - Cal * HDR@DigMin
	HDR@EventTablePos <- HeadLen + HDR@BPB * HDR@NRec
	
	### optional 
	seek(fid, where=HeadLen, origin="start")
	if (all(HDR@GDFTYP==0)) {
	 	data <- readBin(fid, "int", size=1, n=HDR@BPB*HDR@NRec, endian="little")
	} else if (all(HDR@GDFTYP==1)) {
	 	data <- readBin(fid, "int", size=1, n=HDR@BPB*HDR@NRec, endian="little")
	} else if (all(HDR@GDFTYP==2)) {
	 	data <- readBin(fid, "int", size=1, signed=FALSE, n=HDR@BPB*HDR@NRec, endian="little")
	} else if (all(HDR@GDFTYP==3)) {
	 	data <- readBin(fid, "int", size=2, n=HDR@BPB*HDR@NRec/2, endian="little")
	} else if (all(HDR@GDFTYP==4)) {
	 	data <- readBin(fid, "int", size=2, signed=FALSE, n=HDR@BPB*HDR@NRec/2, endian="little")
	} else if (all(HDR@GDFTYP==5)) {
	 	data <- readBin(fid, "int", size=4, n=HDR@BPB*HDR@NRec/4, endian="little")
	} else if (all(HDR@GDFTYP==6)) {
	 	data <- readBin(fid, "int", size=2, signed=FALSE, n=HDR@BPB*HDR@NRec, endian="little")
		L=1:(length(data)/2);
		data = data[L*2-1] + 65536L * data[L*2]
	} else if (all(HDR@GDFTYP==7)) {
	 	data <- readBin(fid, "int", size=4, n=HDR@BPB*HDR@NRec/4, endian="little")
	} else if (all(HDR@GDFTYP==8)) {
	 	data <- readBin(fid, "int", size=2, signed=FALSE, n=HDR@BPB*HDR@NRec/2, endian="little")
		L=1:(length(data)/4);
		data = data[L*4-3] + 65536L*(data[L*4-2] + 65536L*(data[L*4-1] + 65536L*data[L*4]))
	} else if (all(HDR@GDFTYP==16)) {
	 	data <- readBin(fid, "double", size=4, n = HDR@BPB*HDR@NRec/4, endian="little")
	} else if (all(HDR@GDFTYP==17)) {
	 	data <- readBin(fid, "double", size=8, n = HDR@BPB*HDR@NRec/8, endian="little")
	} else if (all(HDR@GDFTYP==18)) {
	 	data <- readBin(fid, "double", size=16, n = HDR@BPB*HDR@NRec/16, endian="little")
	} else if (all(HDR@GDFTYP==(255+24))) {
	 	data <- readBin(fid, "int", size=1, signed=FALSE, n = HDR@BPB*HDR@NRec, endian="little")
		L = 1:(length(data) %/% 3)
		data = data[L*3-2] + 256L*(data[L*3-1] + 256L*data[L*3])
		data = data - c(data>=2^23)*2^24
	} else if (all(HDR@GDFTYP==(511+24))) {
	 	data <- readBin(fid, "int", size=1, signed=FALSE, n = HDR@BPB*HDR@NRec, endian="little")
		L = 1:(length(data) %/% 3)
		data = data[L*3-2] + 256L*(data[L*3-1] + 256L*data[L*3])
	} else {
		stop("channels have different data types - this is not supported yet.")
	}

	k = 0;
	if (all(HDR@spr[chan[1]]==HDR@spr[chan])) {
		SPR  = HDR@spr[chan[1]]
		d   <- matrix(data, nrow=sum(HDR@spr), byrow=FALSE)
		data = matrix(c(1:(HDR@NRec * SPR * length(chan))), ncol=length(chan))
		k    = 0
		for (ch in chan) {
			k = k+1;
			data[,k] = matrix(d[spb[ch]+c(1:HDR@spr[ch]),], ncol=1, byrow=FALSE) * Cal[ch] + Off[ch]
		}
	} else {
		stop("this file is currently not supported (channels have different sampling rates)")
	}
	# H3 <- readBin(fid, "raw", n=NS, size=256);
	## seek EventTablePos

	HDR@data <- data
	close(fid)
	return(HDR)
}

HDR=loadgdf("../data/Newtest17-256.gdf")

# plot(c(1:10000)/HDR@SampleRate, HDR@data[1:10000],type='l')
plot(HDR@data[,1], type='l')
plot( c(1:length(HDR@data[,5]))/HDR@SampleRate, HDR@data[,5], type='l')


