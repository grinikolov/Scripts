function rad_areas_asec_nocycle, 	x, y, xcena, ycena, rad, arcsec
;
; This program computes the area corresponding to the rings in HST/WFPC2
;To run it needs:
;		- x and y positions of the stars
;		- the center of the cluster (in pixels "xcentera", "ycentera")
;		- the radial distances ("rad")
;
;
;PROCEDURE
; The limits of the chips are defined by the stars with minimum/maximum X or Y position on the chip
; The areas itself are the sum of elementary areas of the pixels, falling in the chip boundaries.
;
; It provides:  "areas" - vector containing the corresponding area per each ring
;
;EXAMPLE:   	area= RAD_AREAS_ASEC_NOCICLE(x, y, xcena, ycena, rad, arcsec)
;
;HISTORY
;	Created, "based on ring_test.f" FORTRAN 95 program  -  15 Oct 2008 
;	Modified to compute the limits of the chips 
;        from the positions of the stars, instead of predefined boundaries - 24 Nov 2009
;
;

  if N_params() ne 6 then $
     message,'=============> Syntax:   area= RAD_AREAS(x, y, xcena, ycena, rad, arcsec)  <========='
     
shift= MAX([ABS(x),ABS(y)])+10
pix2as= DOUBLE( 1./arcsec)  	;the pixel scale of WFPC2 in [arcsec/px] from the image header PIXSCALE

pcindx  = WHERE(x GT 0. AND y GT 0., cntpc)
wf2indx = WHERE(x LT 0. AND y GT 0., cntwf2)
wf3indx = WHERE(x LT 0. AND y LT 0., cntwf3)
wf4indx = WHERE(x GT 0. AND y LT 0., cntwf4)

xmaxpc = MAX(x(pcindx))   +shift         ;xmaxpc =  747.0 +shift  ;workable Dimentions of the WFPC2
xminpc = MIN(x(pcindx))   +shift         ;xminpc =    9.0 +shift
ymaxpc = MAX(y(pcindx))   +shift         ;ymaxpc =  737.0 +shift  ;we shift the whole camera by shift px in each direction (in X and Y) for easier calculations
yminpc = MIN(y(pcindx))   +shift         ;yminpc =    4.0 +shift
xmaxwf2= MAX(x(wf2indx))  +shift         ;xmaxwf2=  -52.0 +shift  ;this does not change the computed areas        
xminwf2= MIN(x(wf2indx))  +shift         ;xminwf2=-1679.0 +shift
ymaxwf2= MAX(y(wf2indx))  +shift         ;ymaxwf2= 1633.0 +shift
yminwf2= MIN(y(wf2indx))  +shift         ;yminwf2=    7.0 +shift
xmaxwf3= MAX(x(wf3indx))  +shift         ;xmaxwf3=  -49.0 +shift
xminwf3= MIN(x(wf3indx))  +shift         ;xminwf3=-1671.0 +shift
ymaxwf3= MAX(y(wf3indx))  +shift         ;ymaxwf3=  -15.0 +shift
yminwf3= MIN(y(wf3indx))  +shift         ;yminwf3=-1635.0 +shift
xmaxwf4= MAX(x(wf4indx))  +shift         ;xmaxwf4= 1639.0 +shift
xminwf4= MIN(x(wf4indx))  +shift         ;xminwf4=   14.0 +shift
ymaxwf4= MAX(y(wf4indx))  +shift         ;ymaxwf4=  -17.0 +shift
yminwf4= MIN(y(wf4indx))  +shift         ;yminwf4=-1639.0 +shift

xcentera = xcena +shift	; <-- here we shift the Center of the cluster too
ycentera = ycena +shift



;ster =  abs(rad[1] - rad[0])			;the radial step for the profile
;rad = ster+ findgen(N_rads) * ster 		;vector containing the radii
;d_arr=dblarr(2*shift,2*shift)   			;array to contain the distance of each pixel to the center of the cluster

;;::::::: Subroutine ARRINGS  :::::::::
;;WFC 2
;print, 'Computing the areas ...'
;print, ' WFC2 '
;		for j = yminwf2,(ymaxwf2) do begin 			; by Y axis
;			for i = xminwf2, (xmaxwf2) do begin		     	;by X axis
;				d= double(sqrt ( ( i - xcentera)^2.  + (j -ycentera)^2. ) )					;distance of the pixel to the center
;				d_arr[i,j]= d
;			endfor ;by X axis
;		endfor ;by Y axis
;
;;PC 
;print, ' PC '
;		for j = yminpc,(ymaxpc) do begin 			; by Y axis
;			for i = xminpc, (xmaxpc) do begin		     	;by X axis
;				d= double(sqrt ( ( i - xcentera)^2.  + (j -ycentera)^2. ) )					;distance of the pixel to the center
;				d_arr[i,j]= d
;			endfor ;by X axis
;		endfor ;by Y axis
;
;;WFC 3
;print, ' WFC3 '
;		for j = yminwf3,(ymaxwf3) do begin 			; by Y axis
;			for i = xminwf3, (xmaxwf3) do begin		     	;by X axis
;				d= double(sqrt ( ( i - xcentera)^2.  + (j -ycentera)^2. ) )					;distance of the pixel to the center
;				d_arr[i,j]= d
;			endfor ;by X axis
;		endfor ;by Y axis
;
;;WFC 4
;print, ' WFC4 '
;		for j = yminwf4,(ymaxwf4) do begin 			; by Y axis
;			for i = xminwf4, (xmaxwf4) do begin		     	;by X axis
;				d= double(sqrt ( ( i - xcentera)^2.  + (j -ycentera)^2. ) )					;distance of the pixel to the center
;				d_arr[i,j]= d
;			endfor ;by X axis
;		endfor ;by Y axis
;
;;;;;  END of subroutine ARRING   ::::::::::::::::::::::::::::

; here we count the number of pixels in each radial ring - the count is npx03 per radius between 0.2--0.3 arcminutes
;r01= WHERE (d_arr ge (0.001) and d_arr lt (rad[0]*arcsec) , npx01)
;r02= WHERE (d_arr ge (rad[0]*arcsec) and d_arr lt (rad[1]*arcsec) , npx02)
;r03= WHERE (d_arr ge (rad[1]*arcsec) and d_arr lt (rad[2]*arcsec) , npx03)
;r04= WHERE (d_arr ge (rad[2]*arcsec) and d_arr lt (rad[3]*arcsec) , npx04)
;r05= WHERE (d_arr ge (rad[3]*arcsec) and d_arr lt (rad[4]*arcsec) , npx05)
;r06= WHERE (d_arr ge (rad[4]*arcsec) and d_arr lt (rad[5]*arcsec) , npx06)
;r07= WHERE (d_arr ge (rad[5]*arcsec) and d_arr lt (rad[6]*arcsec) , npx07)
;r08= WHERE (d_arr ge (rad[6]*arcsec) and d_arr lt (rad[7]*arcsec) , npx08)
;r09= WHERE (d_arr ge (rad[7]*arcsec) and d_arr lt (rad[8]*arcsec) , npx09)
;r10= WHERE (d_arr ge (rad[8]*arcsec) and d_arr lt (rad[9]*arcsec) , npx10)
;r11= WHERE (d_arr ge (rad[9]*arcsec) and d_arr lt (rad[10]*arcsec) , npx11)
;r12= WHERE (d_arr ge (rad[10]*arcsec) and d_arr lt (rad[11]*arcsec) , npx12)
;r13= WHERE (d_arr ge (rad[11]*arcsec) and d_arr lt (rad[12]*arcsec) , npx13)
;r14= WHERE (d_arr ge (rad[12]*arcsec) and d_arr lt (rad[13]*arcsec) , npx14)
;r15= WHERE (d_arr ge (rad[13]*arcsec) and d_arr lt (rad[14]*arcsec) , npx15)
;r16= WHERE (d_arr ge (rad[14]*arcsec) and d_arr lt (rad[15]*arcsec) , npx16)
;r17= WHERE (d_arr ge (rad[15]*arcsec) and d_arr lt (rad[16]*arcsec) , npx17)
;r18= WHERE (d_arr ge (rad[16]*arcsec) and d_arr lt (rad[17]*arcsec) , npx18)
;r19= WHERE (d_arr ge (rad[17]*arcsec) and d_arr lt (rad[18]*arcsec) , npx19)
;r20= WHERE (d_arr ge (rad[18]*arcsec) and d_arr lt (rad[19]*arcsec) , npx20)
;r21= WHERE (d_arr ge (rad[19]*arcsec) and d_arr lt (rad[20]*arcsec) , npx21)

;;areas_px= [npx01, npx02, npx03, npx04, npx05, npx06, npx07, npx08, npx09, npx10, npx11, npx12, npx13, npx14, npx15, npx16, npx17, npx18, npx19, npx20, npx21]   ;the vector contains the number of pixels found in each radius
;areahist= HISTOGRAM(d_arr, binsize=((rad[1]-rad[0])*arcsec), min=0.001, max=(rad[n_elements(rad)-1]*arcsec) )
;areas= DOUBLE( areahist *(pix2as^2.) )    			;the vector contains the area, corresponding to each ring, in [arcsec^2]
;rad_px= rad /pix2as						; the radial distance in pixels


;;; Avoiding Cycles
rowx = ABS(findgen(2*shift) - xcentera ) 	;creating distances in X direction 
coly = ABS(findgen(2*shift) - ycentera ) 	;creating distances in Y direction
xcarray= dblarr(2*shift,2*shift)  		; spreading X distances in Y direction
ycarray= dblarr(2*shift,2*shift)  		; spreading Y distances in X direction
for i=0, n_elements(coly)-1 DO 	xcarray[*,i]= rowx    ; populating the array with the X distances
for i=0, n_elements(rowx)-1 DO 	ycarray[i,*]= coly    ; populating the array with the Y distances
d_arr_unmasked= SQRT(xcarray^2 + ycarray^2) ; The expected areas if no gaps between the chips
mask= d_arr_unmasked*0 				; we use mask to account fo the shape of the WFPC2 
mask[xminpc :xmaxpc ,yminpc :ymaxpc ]=1 ; masking the areas not covered by the chips (setting them to 0)
mask[xminwf2:xmaxwf2,yminwf2:ymaxwf2]=1
mask[xminwf3:xmaxwf3,yminwf3:ymaxwf3]=1
mask[xminwf4:xmaxwf4,yminwf4:ymaxwf4]=1
d_arr1=d_arr_unmasked*mask 		; distances of the pixels of the cameras to the center of cluster
areahist1= HISTOGRAM(d_arr1, binsize=((rad[1]-rad[0])*arcsec), min=0.001, max=(rad[n_elements(rad)-1]*arcsec) ) ;Grouping the distances according to rad
areas1= DOUBLE( areahist1 *(pix2as^2.) )    			;the vector contains the area, corresponding to each ring, in [arcsec^2]

;;; and the Expected areas if no gaps between the chips                 (they should not be limited, but we cannot use infinite arrays, right!)
areahist_expected= HISTOGRAM(d_arr_unmasked, binsize=((rad[1]-rad[0])*arcsec), min=0.001, max=(rad[n_elements(rad)-1]*arcsec) ) ;Grouping the distances according to rad
areas_expected= DOUBLE( areahist_expected *(pix2as^2.) )    			;the vector contains the area, corresponding to each ring, in [arcsec^2]


;stop 
;;; End of Avoiding Cycles

print, " Radius: [in arcsec] ", ' Npx in ring: ', " Areas: [in sqare arcsec] ", " Expected areas "
printcol, rad,  areahist1, areas1, areas_expected

; CTLoad, 16, /BREWER
; window, /free, title='Areas around the cluster'
; surfr, az=240, ax=40
; contour, d_arr1, levels=(rad*arcsec), /isotropic , /fill , title='Areas around the cluster', xtit='X [px]', ytit='Y [px]' ,/t3d, /nodata
; CTLoad, 16, /BREWER, /REVERSE
; contour, d_arr1, levels=(rad*arcsec), /isotropic , /fill , title='Areas around the cluster', xtit='X [px]', ytit='Y [px]' ,/t3d, /overplot


xcentera = xcentera -shift	; <-- here we shift the Center of the cluster 
ycentera = ycentera -shift	;     back to the original values (xcena, ycena)
xcarray=0 & ycarray=0 & mask=0 & d_arr=0 & d_arr1=0 & d_arr_unmasked=0  	; to preserve memory

return,[TRANSPOSE(areas1), TRANSPOSE(areas_expected)]
end
