function [HDR]=sseek(HDR,offset,origin)
% SSEEK repositions file position indicator
% [HDR]=sseek(HDR,offset,origin)
%
% The meaning of "offset" and "origin" differs for different formats. 
% 	EDF: number of (EDF) records. 
%	BKR: number of samplepoints	
%
% See also: SOPEN, SREAD, SWRITE, SCLOSE, SSEEK, SREWIND, STELL, SEOF

%	$Id: sseek.m,v 1.13 2005-05-13 17:47:38 schloegl Exp $
%	(C) 1997-2005 by Alois Schloegl <a.schloegl@ieee.org>	
%    	This is part of the BIOSIG-toolbox http://biosig.sf.net/

% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the  License, or (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.



if strcmp(origin,'bof')
	origin = -1;        
elseif strcmp(origin,'cof')
	origin = 0;        
elseif strcmp(origin,'eof')
	origin = 1;        
end;

if origin == -1, 
        HDR.FILE.POS = offset;
        if strmatch(HDR.TYPE,{'BDF','EDF','GDF','MFER','SCP','native','TMS32','WG1'}),
	elseif HDR.FILE.FID>2,
                POS = HDR.HeadLen+HDR.AS.bpb*offset;
                if POS~=ceil(POS),  % for alpha format
                        fprintf(HDR.FILE.stderr,'Error STELL (alpha): starting position is non-integer\n');     
                        return;
                end
                HDR.FILE.status = fseek(HDR.FILE.FID,POS,-1);
        end
        
elseif origin == 0, 
        HDR.FILE.POS = HDR.FILE.POS + offset;
        if strmatch(HDR.TYPE,{'BDF','EDF','GDF','MFER','SCP','native','TMS32','WG1'}),
	elseif HDR.FILE.FID>2,
                POS = HDR.AS.bpb*offset;
                if POS~=ceil(POS),  % for alpha format
                        fprintf(HDR.FILE.stderr,'Error STELL (alpha): starting position is non-integer\n');     
                        return;
                end
                HDR.FILE.status = fseek(HDR.FILE.FID,POS,0);
        end
        
elseif origin == 1, 
	if 0, %strmatch(HDR.TYPE,{}),
		HDR.FILE.POS = HDR.NRec+offset;
		HDR.FILE.status = fseek(HDR.FILE.FID,HDR.AS.bpb*offset,1);
	elseif strmatch(HDR.TYPE,{'BDF','EDF','GDF'}),
		POS = HDR.NRec*HDR.SPR+offset;
	elseif strmatch(HDR.TYPE,{'ACQ','CTF','Nicolet'}),
		POS = HDR.AS.endpos+offset*HDR.AS.bpb;
		HDR.FILE.status = fseek(HDR.FILE.FID,POS,-1);
		HDR.FILE.POS = (POS-HDR.HeadLen)/HDR.AS.bpb;
	elseif strmatch(HDR.TYPE,{'BKR','ISHNE','RG64','MIT','LABVIEW','SMA','BVbinmul','BCI2000'}),
		HDR.FILE.POS = HDR.AS.endpos+offset;
		HDR.FILE.status = fseek(HDR.FILE.FID,HDR.AS.bpb*offset,1);
	elseif strmatch(HDR.TYPE,{'CNT','EEG','AVG','EGI','SND','WAV','AIF','CFWB','DEMG'}),
		HDR.FILE.POS = HDR.AS.endpos+offset;
		HDR.FILE.status = fseek(HDR.FILE.FID,HDR.HeadLen+(HDR.AS.endpos+offset)*HDR.AS.bpb,-1);
        elseif strmatch(HDR.TYPE,{'alpha'}),
                POS = HDR.HeadLen+(HDR.AS.endpos+offset)*HDR.AS.bpb;
                if POS~=ceil(POS),  % for alpha format
                        fprintf(HDR.FILE.stderr,'Error STELL (alpha): starting position is non-integer\n');
                        return;
                end
		HDR.FILE.POS = HDR.AS.endpos+offset;
		HDR.FILE.status = fseek(HDR.FILE.FID,POS,-1);
        elseif strmatch(HDR.TYPE,{'RDF','SIGIF'}),
		HDR.FILE.POS = length(HDR.Block.Pos)+offset;
        elseif strmatch(HDR.TYPE,{'BVascii','BVbinvec','EEProbe-CNT','EEProbe-AVR','FIF','native','MFER','SCP','TMS32','WG1'}),
		HDR.FILE.POS = HDR.AS.endpos+offset;
	else
		fprintf(HDR.FILE.stderr,'Warning SSEEK: format %s not supported.\n',HDR.TYPE);	
	end;
else
        fprintf(2,'error SSEEK: 3rd argument "%s" invalid\n',origin);
        return;
end;

