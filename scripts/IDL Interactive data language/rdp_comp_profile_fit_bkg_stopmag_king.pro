 pro rdp_comp_profile_fit_bkg_stopmag_king

SET_PLOT, 'X' & !p.font=-1 & multiplot, [1,1]    ; & !x.margin=[12,3]  	;Selecting normal font type & larger X margin for labels
windown=0

;
; Setting the completeness limit to something low (e.g. 0.1)
;
; Then stoping the profiles at some magnitude that is incomplete in the central regions
; based on the completeness function integrated over radius, depending only on magnitude (MaxMagIndx).
;
;
;;;================ Provide the following  ===================================================
;
; /home/grigor/Documents/hst/ngc1711/ngc1711re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc1711/ngc1711re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc/ngcre_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc/ngcre_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc1898/ngc1898re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc1898/ngc1898re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc1984/ngc1984re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc1984/ngc1984re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc2011/ngc2011re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc2011/ngc2011re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc2031/ngc2031re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc2031/ngc2031re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc2121/ngc2121re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc2121/ngc2121re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc2157/ngc2157re_sky_f0.5.pht     /home/grigor/Documents/hst/ngc2157/ngc2157re_sky_f0.5.pht.fake
; /home/grigor/Documents/hst/ngc2214/ngc2214re_sky_f0.5.pht 	/home/grigor/Documents/hst/ngc2214/ngc2214re_sky_f0.5.pht.fake


;       cluster_name= 'BSDL 101'
;       READCOL, '/home/grigor/Documents/hst/bsdl100/bsdl100re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/bsdl100/bsdl100re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/bsdl100/u2y8050hr_c0f.fits', hdr) ;The positioning info of WFPC2_READ is wrong!!!  WFPC2_READ, '',image, hdr, /BATWING
; RA_targ=    72.723925   &  DEC_targ=  -70.005381 	 ;<-header keywords, the X,Y position of NGC1711 on the camera 		
; RA_targMcK=  RA_targ  &  DEC_targMcK=  DEC_targ	   
; RA_targBica=   DOUBLE(15.*( 04 + 51./60. + 04.4/3600.))     &  DEC_targBica=  DOUBLE( -(70 + 00./60. + 45.03/3600.))  
                 
;       cluster_name= 'NGC 1711'
;       READCOL, '/home/grigor/Documents/hst/ngc1711/ngc1711re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc1711/ngc1711re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc1711/u2y80501m_c0f.fits', hdr) ;The positioning info of WFPC2_READ is wrong!!!  WFPC2_READ, '',image, hdr, /BATWING
; RA_targ=    72.65583333333d   &  DEC_targ=  -69.98500000000d	;NGC1711 ;<-header keywords		
; RA_targMcK=  DOUBLE(15.*( 04 + 50./60. + 37.3/3600. ))  &  DEC_targMcK=  DOUBLE( -(69 + 59./60. + 04./3600.))	   ;NGC1711 [RA 04:50:37.3 , DEC -69:59:04]
; RA_targBica=  DOUBLE(15.*( 4. + 50./60. + 37./3600. ))  &  DEC_targBica=  DOUBLE( -( 69. + 59./60. + 06./3600.))  ;NGC1711 4:50:37  -69:59:06

;;       cluster_name= 'NGC 1850'
;; image=READFITS('/home/grigor/Documents/hst/ngc1850/u26m1e02t_c0f.fits', hdr)
;; RA_targ=    77.17165d 	;RA_cen=  77.17165d	;The Gilmore's center, converted by Aladin
;; DEC_targ=  -68.75861d	;DEC_cen= -68.75861d	;NGC1850
;; RA_targMcK=  DOUBLE(15.*( 05 + 08./60. + 41.2/3600. ))  &  DEC_targMcK=  DOUBLE( -(68 + 45./60. + 31./3600.)) 	   ;NGC1850 [RA 05:08:41.2 , DEC -68:45:31]
;; RA_targBica=  DOUBLE(15.*( 5. + 08./60. + 46./3600. ))  &  DEC_targBica=  DOUBLE( -( 68. + 45./60. + 39./3600.))  ;NGC1850 5:08:46  -68:45:39

;       cluster_name= 'NGC 1898'
;       READCOL, '/home/grigor/Documents/hst/ngc1898/ngc1898re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc1898/ngc1898re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc1898/u2xq0303t_c0f.fits', hdr)
; RA_targ=    79.17708333333d	&  DEC_targ=  -69.65625000000d	;NGC1898	;<-header keywords	
; RA_targMcK=  DOUBLE(15.*( 05 + 16./60. + 42.4/3600. ))  &  DEC_targMcK=  DOUBLE( -(69 + 39./60. + 25./3600.))	   ;NGC1898 [RA 05:16:42.4 , DEC -69:39:25]	
; RA_targBica=  DOUBLE(15.*( 5. + 16./60. + 41./3600. ))  &  DEC_targBica=  DOUBLE( -( 69. + 39./60. + 23./3600.))  ;NGC1898  5:16:41  -69:39:23 

;       cluster_name= 'NGC 1984'
;       READCOL, '/home/grigor/Documents/hst/ngc1984/ngc1984re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc1984/ngc1984re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc1984/u5ay0901r.c0f.fits', hdr)
; RA_targ=    81.91908333333d	&  DEC_targ=  -69.13422777778d	;NGC1984 	;<-header keywords	
; RA_targMcK=  DOUBLE(15.*( 05 + 27./60. + 40.8/3600. ))  &  DEC_targMcK=  DOUBLE( -(69 + 08./60. + 05./3600.))	   ;NGC1984 [RA 05:27:40.8 , DEC -69:08:05]
; RA_targBica=  DOUBLE(15.*( 5. + 27./60. + 40./3600. ))  &  DEC_targBica=  DOUBLE( -( 69. + 08./60. + 03./3600.))  ;NGC1984 5:27:40  -69:08:03

;       cluster_name= 'NGC 2011'
;       READCOL, '/home/grigor/Documents/hst/ngc2011/ngc2011re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc2011/ngc2011re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc2011/u5ay0801r_c0f.fits', hdr)
; RA_targ=    83.08116666667d	&  DEC_targ=  -67.52195000000d	;NGC2011	;<-header keywords		
; RA_targMcK=  DOUBLE(15.*( 05 + 32./60. + 19.6/3600. ))  &  DEC_targMcK=  DOUBLE( -(67 + 31./60. + 14./3600.))	   ;NGC2011 [RA 05:32:19.6 , DEC -67:31:14]
; RA_targBica=  DOUBLE(15.*( 5. + 32./60. + 19./3600. ))  &  DEC_targBica=  DOUBLE( -( 67. + 31./60. + 16./3600.))  ;NGC2011  5:32:19  -67:31:16

;       cluster_name= 'NGC 2019'
;       READCOL, '/home/grigor/Documents/hst/PropID5916/NGC2019/ngc2019re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/PropID5916/NGC2019/ngc2019re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/PropID5916/NGC2019/u2xq0603t_c0f.fits', hdr)
; RA_targ=  82.98666666667d  	&  DEC_targ=  -70.15944444444d	;NGC2019	;<-header keywords		
; RA_targMcK=  DOUBLE(15.*( 05 + 31./60. + 56.6/3600. ))  &  DEC_targMcK=  DOUBLE( -(70 + 09./60. + 33./3600.))	   ;NGC2019 [RA 05:31:56.6 , DEC -70:09:33]
; RA_targBica=  DOUBLE(15.*( 5. + 31./60. + 56./3600. ))  &  DEC_targBica=  DOUBLE( -( 70. + 09./60. + 33./3600.))  ;NGC2019  5:31:56  -70:09:33

;       cluster_name= 'NGC 2031'
;       READCOL, '/home/grigor/Documents/hst/ngc2031/ngc2031re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc2031/ngc2031re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc2031/u2y80301t_c0f.fits', hdr)
; RA_targ=    83.42083333333d	&  DEC_targ=  -70.98722222222d	;NGC2031	;<-header keywords	
; RA_targMcK=  DOUBLE(15.*( 05 + 33./60. + 41.1/3600. ))  &  DEC_targMcK=  DOUBLE( -(70 + 59./60. + 13./3600.))	   ;NGC2031 [RA 05:33:41.1 , DEC -70:59:13]
; RA_targBica=  DOUBLE(15.*( 5. + 33./60. + 41./3600. ))  &  DEC_targBica=  DOUBLE( -( 70. + 59./60. + 12./3600.))  ;NGC2031 5:33:41  -70:59:12 

;       cluster_name= 'NGC 2121'
;       READCOL, '/home/grigor/Documents/hst/ngc2121/ngc2121re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc2121/ngc2121re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc2121/u5dd0106r.c0f.fits', hdr)
; RA_targ=    87.05291666667d	&  DEC_targ=  -71.47972222222d	;NGC2121		;<-header keywords 
; RA_targMcK=  DOUBLE(15.*( 05 + 48./60. + 11.6/3600. ))  &  DEC_targMcK=  DOUBLE( -(71 + 28./60. + 51./3600.))	   ;NGC2121 [RA 05:48:11.6 , DEC -71:28:51]
; RA_targBica=  DOUBLE(15.*( 5. + 48./60. + 12./3600. ))  &  DEC_targBica=  DOUBLE( -( 71. + 28./60. + 50./3600.))  ;NGC2121  5:48:12  -71:28:50

;;;       cluster_name= 'NGC 2157 V only'
;;;       READCOL, '/home/grigor/Documents/hst/ngc2157/reduced_hstphot/ngc2157re_sky_Vonly.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
;;;       READCOL, '/home/grigor/Documents/hst/ngc2157/ngc2157re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
;;; image=READFITS('/home/grigor/Documents/hst/ngc2157/u2y80401t.c0f.fits', hdr)
;;; RA_targ=     89.39479166667d	&  DEC_targ=  -69.19638888889d	;NGC2157		;<-header keywords 
;;; RA_targMcK=  DOUBLE(15.*( 05 + 57./60. + 32.4/3600. ))  &  DEC_targMcK=  DOUBLE( -(69 + 11./60. + 49./3600.))	   ;NGC2157 [RA 05:57:32.4 , DEC -69:11:49]
;;; RA_targBica=  DOUBLE(15.*( 5. + 57./60. + 34./3600. ))  &  DEC_targBica=  DOUBLE( -( 69. + 11./60. + 48./3600.))  ;NGC2157  5:57:34  -69:11:48

       cluster_name= 'NGC 2157'
       READCOL, '/home/grigor/Documents/hst/ngc2157/ngc2157re_sky_f0.5.pht'	, n, x, y, mv, emv, mi, emi, col, ecol
       READCOL, '/home/grigor/Documents/hst/ngc2157/ngc2157re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
 image=READFITS('/home/grigor/Documents/hst/ngc2157/u2y80401t.c0f.fits', hdr)
 RA_targ=     89.39479166667d	&  DEC_targ=  -69.19638888889d	;NGC2157		;<-header keywords 
 RA_targMcK=  DOUBLE(15.*( 05 + 57./60. + 32.4/3600. ))  &  DEC_targMcK=  DOUBLE( -(69 + 11./60. + 49./3600.))	   ;NGC2157 [RA 05:57:32.4 , DEC -69:11:49]
 RA_targBica=  DOUBLE(15.*( 5. + 57./60. + 34./3600. ))  &  DEC_targBica=  DOUBLE( -( 69. + 11./60. + 48./3600.))  ;NGC2157  5:57:34  -69:11:48

;;;       cluster_name= 'NGC 2214'
;;;       READCOL, '/home/grigor/Documents/hst/ngc2214/ngc2214re_sky_f0.5.pht', n, x, y, mv, emv, mi, emi, col, ecol
;;;       READCOL, '/home/grigor/Documents/hst/ngc2214/ngc2214re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
;;; image=READFITS('/home/grigor/Documents/hst/ngc2214/u5ay1101r_c0f.fits', hdr)
;;; RA_targ=   93.24095833333d	&  DEC_targ= -68.26016666667d	;NGC2214	;<-header keywords	
;;; RA_targMcK=  DOUBLE(15.*( 06 + 12./60. + 55.8/3600. ))  &  DEC_targMcK=  DOUBLE( -(68 + 15./60. + 38./3600.))      ;NGC2214 [RA 06:12:55.8 , DEC -68:15:38]
;;; RA_targBica=  DOUBLE(15.*( 6. + 12./60. + 58./3600. ))  &  DEC_targBica=  DOUBLE( -( 68. + 15./60. + 30./3600.))  ;NGC2214e [RA 6:12:58 , DEC -68:15:30] ;NGC2214w [RA 6:12:53 , DEC -68:15:35]


;       cluster_name= 'NGC 2214'
;       READCOL, '/home/grigor/Documents/hst/ngc2214/ngc2214_set2_re_sky_f0.5.pht', n, x, y, mv, emv, mi, emi, col, ecol
;       READCOL, '/home/grigor/Documents/hst/ngc2214/ngc2214_set2_re_sky_f0.5.pht.fake', format='f,f,x,x,f,x,f,x,x,i', X_in, Y_in, V_in, I_in, recovered_flag
; image=READFITS('/home/grigor/Documents/hst/ngc2214/u5ay0202r_c0f_set2.fits', hdr)
; RA_targ=   93.24095833333d	&  DEC_targ= -68.26016666667d	;NGC2214		;<-header keywords 	
; RA_targMcK=  DOUBLE(15.*( 06 + 12./60. + 55.8/3600. ))  &  DEC_targMcK=  DOUBLE( -(68 + 15./60. + 38./3600.))	   ;NGC2214 [RA 06:12:55.8 , DEC -68:15:38]
; RA_targBica=  DOUBLE(15.*( 6. + 12./60. + 53./3600. ))  &  DEC_targBica=  DOUBLE( -( 68. + 15./60. + 35./3600.)) ;NGC2214w [RA 6:12:53 , DEC -68:15:35] ; RA_targBica=  DOUBLE(15.*( 6. + 12./60. + 58./3600. ))  &  DEC_targBica=  DOUBLE( -( 68. + 15./60. + 38./3600.))  ;NGC2214e [RA 6:12:58 , DEC -68:15:30]

; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;converting the X,Y coordinates into RA,DEC
extast, hdr, astr

XY2AD, x,y, astr, ra,dec

;CENTER of the cluster 
AD2XY, RA_targ, DEC_targ, astr, xcenh, ycenh				;we use the same image header, as for "xy2ad"
arcsec=1./0.04552			; 1 arcsec is PIXSCALE^-1 image header keyword = 21.9684 px in WCS (or use IDL> GETROT, Hdr,  Rot, PIXSCALE_in_deg)

     ;CENTER of the cluster  [found by McKey & Gilmore 2003]
AD2XY, RA_targMcK, DEC_targMcK, astr, xcen_mackey, ycen_mackey				;we use the same image header, as for "xy2ad"
     ;Cluster centers from Bica 2008
AD2XY, RA_targBica, DEC_targBica, astr, xcen_bica, ycen_bica				;we use the same image header, as for "xy2ad"



; Select a CENTRE for the profiles:
 IF  cluster_name EQ 'BSDL 101'  THEN  xcena=  xcenh        &  IF  cluster_name EQ 'BSDL 101'  THEN   ycena=  ycenh
 IF  cluster_name EQ 'NGC 1711'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 1711'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 1898'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 1898'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 1984'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 1984'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 2011'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 2011'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 2019'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 2019'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 2031'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 2031'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 2121'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 2121'  THEN   ycena=  ycen_mackey
 IF  cluster_name EQ 'NGC 2157'  THEN  xcena=  xcen_bica    &  IF  cluster_name EQ 'NGC 2157'  THEN   ycena=  ycen_bica
 IF  cluster_name EQ 'NGC 2214'  THEN  xcena=  xcen_mackey  &  IF  cluster_name EQ 'NGC 2214'  THEN   ycena=  ycen_mackey

windown=windown+1 &    window, windown
plot, x,y, psym=3, /isotropic
oplot, [xcen_mackey,xcen_mackey],[ycen_mackey,ycen_mackey], psym=2, symsize=4, color=FSC_COLOR("red"), thick=2
xyouts, 1000,1800, "*  Mackey", color=FSC_COLOR("red")
oplot, [xcenh,xcenh],[ycenh,ycenh], psym=7, symsize=4, color=FSC_COLOR("blue"), thick=2
xyouts, 1000,1600, "x  header", color=FSC_COLOR("blue")
oplot, [xcen_bica,xcen_bica],[ycen_bica,ycen_bica], psym=5, symsize=4, color=FSC_COLOR("orange"), thick=2
xyouts, 1000,1400, TeXtoIDL("\Delta")+" Bica 2008", color=FSC_COLOR("orange")
oplot, [xcena,xcena],[ycena,ycena], psym=1, symsize=4, color=FSC_COLOR("maroon"), thick=2
xyouts, 1000,1200, "+ used", color=FSC_COLOR("maroon")

 IF (ABS(xcena) GT 5000. OR ABS(ycena) GT 5000.) THEN BEGIN 		;centering check
		print, "ERROR Cluster center incorrect! Check input or header info" & return
 ENDIF  							;centering check


;;; FIND MY OWN CENTER

binhist = arcsec * 2  	;size of the bin
h2d=HIST_ND([1#x,1#y], binhist ,REVERSE_INDICES=ri)

;zfit = MPFIT2DPEAK(h2d, fit, WEIGHTS=1D/h2d)
;xcen=fit[4]*binhist+min(x)
;ycen=fit[5]*binhist+min(y)
;
;oplot, [xcen,xcen],[ycen,ycen], psym=6, symsize=4, color=FSC_COLOR("green"), thick=2
;xyouts, 1000,1400, "SQ Gauss Fit", color=FSC_COLOR("green")
;;; Did not find my own center

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;;; Density map
map_bin= [100,100]  	; bin size for the Density Map for [x,y] in pixels
densitymap= HIST_ND([1#x,1#y], map_bin, min=-1600, max=1599)
fakedensitymap= HIST_ND([1#x_in,1#y_in], map_bin/10, min=-1600, max=1599)
;==================================================================================================
;   		RINGS
step_r= 4.0  &  max_r= 120   & max_rad_fit= 90				; Define the radial step and the maximum distance [ in arcseconds]
rad= step_r* findgen(max_r/step_r)+ step_r 		; The radial distance in arcsec
rad_fit= rad(WHERE(rad LE max_rad_fit)) - (0.5*step_r)		;rad_fit= rad(WHERE(rad LE 90)) - (0.5*step_r)		; for the fitting we use the middle of the ring, instead of its end
log_r= alog10(rad)			;Logarithm of the Radial Distance

;arcmin=1200.       			; 1 arcmin = 1200 px in world coordinates
d= sqrt( (x-xcena)^2 + (y-ycena)^2)     ; the distance from the center of the primary cluster (xcen,ycen) [in pixels]
;d_am= d /arcmin			; the distance from the center of the primary cluster (xcen,ycen) [in arcmin]
d_as= d /arcsec 			; the distance from the center of the primary cluster (xcen,ycen) [in arcsec]

; plotting selected rings
ring5= WHERE(d_as GT 5*step_r AND d_AS LT 6*step_r)
oplot, x[ring5],y[ring5], psym=3, color=FSC_COLOR("red")   
XYOUTS, x[ring5[WHERE(y[ring5] EQ MAX(y[ring5]))]], y[ring5[WHERE(y[ring5] EQ MAX(y[ring5]))]], STRING(5*step_r, FORMAT="(i3)")+ "-" + STRING(6*step_r, FORMAT="(i3)") +"as"   ;indicating 5-th ring
ring10= WHERE(d_as GT 10*step_r AND d_AS LT 11*step_r)
oplot, x[ring10],y[ring10], psym=3, color=FSC_COLOR("red")                                                                                    ;indicating 10-th ring
XYOUTS, x[ring10[WHERE(y[ring10] EQ MAX(y[ring10]))]], y[ring10[WHERE(y[ring10] EQ MAX(y[ring10]))]], STRING(10*step_r, FORMAT="(i3)")+ "-" + STRING(11*step_r, FORMAT="(i3)") +"as"   ;indicating 10-th ring
ringMaxFit= WHERE(d_as GT MAX(rad_fit)-0.5*step_r AND d_AS LT  MAX(rad_fit)+0.5*step_r)
oplot, x[ringMaxFit],y[ringMaxFit], psym=3, color=FSC_COLOR("red") ;indicating the last ring to fit
XYOUTS, x[ringMaxFit[WHERE(y[ringMaxFit] EQ MAX(y[ringMaxFit]))]], y[ringMaxFit[WHERE(y[ringMaxFit] EQ MAX(y[ringMaxFit]))]], STRING(MAX(rad_fit)-0.5*step_r, FORMAT="(i3)")+ "-" +STRING(MAX(rad_fit)+0.5*step_r, FORMAT="(i3)") +"as"   ;indicating the last ring to fit

; oplot, x(WHERE(d_as GT 5*step_r AND d_AS LT 6*step_r)),y(WHERE(d_as GT 5*step_r AND d_AS LT 6*step_r)), psym=3, color=FSC_COLOR("red")     ;indicating 5-th ring
; oplot, x(WHERE(d_as GT 10*step_r AND d_AS LT 11*step_r)),y(WHERE(d_as GT 10*step_r AND d_AS LT 11*step_r)), psym=3, color=FSC_COLOR("red") ;indicating 10-th ring
; oplot, x(WHERE(d_as GT MAX(rad_fit)-0.5*step_r AND d_AS LT  MAX(rad_fit)+0.5*step_r)),y(WHERE(d_as GT MAX(rad_fit)-0.5*step_r AND d_AS LT  MAX(rad_fit)+0.5*step_r)), psym=3, color=FSC_COLOR("red") ;indicating the last ring to fit

;==================================================================================================
;	    	MAGNITUDES  
step_mag= 1.0     & max_mag= 29.5
mags= step_mag * indgen(20)+10.  	;the vector, containing the magnitudes in the range of the magnitude bins for the cluster
;mags1= 2.*indgen(10)+10.  	

mag14= WHERE (mv gt 14 and mv lt 15)     
mag15= WHERE (mv gt 15 and mv lt 16)
mag16= WHERE (mv gt 16 and mv lt 17)
mag17= WHERE (mv gt 17 and mv lt 18)
mag18= WHERE (mv gt 18 and mv lt 19)
mag19= WHERE (mv gt 19 and mv lt 20)
mag20= WHERE (mv gt 20 and mv lt 21)
mag21= WHERE (mv gt 21 and mv lt 22)
mag22= WHERE (mv gt 22 and mv lt 23)
mag23= WHERE (mv gt 23 and mv lt 24)
mag24= WHERE (mv gt 24 and mv lt 25)
mag25= WHERE (mv gt 25 and mv lt 26)
mag26= WHERE (mv gt 26 and mv lt 27)


;	LUMINOSITY   function
lfbin=0.5
LF= HISTOGRAM( mv, BINSIZE=lfbin, MIN=10.0, MAX=29.0 , REVERSE_INDICES=ri_LF)

windown=windown+1 &    window, windown
;plot, (lfbin*indgen(20/lfbin) +10.) , LF, thick=3, psym=10, xtit='magnitude',ytit=lfbin, title='LF for '+cluster_name
plothist, mv, bin=lfbin, thick=3, /boxplot, xtit='magnitude', ytit='Number of stars', title='LF for '+cluster_name

; Distance Scale in LMC
LMC_pc=10^ (0.2* (18.5 +5 )) 		; The distance in [parsecs] to LMC, (applying distance modulus=18.5)
parsec= 206265./LMC_pc 			; The scale at the distance of the LMC  in [arcsec / parsec] = 4.1155  ==> 1 arcsec =approx. 0.25 parsecs


; ^^^^^^^^^^   PROFILES section  ^^^^^^^^^^^^^^^^^^^^^^^^                                                        
;;;---------- COMPLETENESS correction   ------------------
completeness_limit= 0.1 					; Setting the limit value  (is 0.7 reasonable?)

; compl= RAD_COMPLETENESS_ASEC(xcena, ycena, rad, mags, step_mag, step_r, max_r, max_mag, n, x, y, mv, emv, mi, emi, col, ecol, fn, fx, fy, fmv, femv, fmi, femi, fcol, fecol)
; 	; Applying a limit for the completeness
; limit_compl= WHERE( compl LE completeness_limit)		; Limiting the completeness
; compl(limit_compl) = 0.0
; compl_corr= 1./ compl				; the Completeness correction is the inverse of the completeness
; nan= WHERE ( NOT FLOAT( FINITE(compl_corr) ))   ; finding the NaN values in the completeness
; compl_corr(nan)=0.0				; giving the NaN-s a completeness value of 0 
; n_st_hist= n_st_histog * compl_corr
; ;;end of completeness section
      
; COMPLETENESS using the HSTphot artificial star test ( *.dat.fake from option 64)
d_fake_stars= sqrt( (x_in-xcena)^2 + (y_in-ycena)^2)    ; the distance from the center of the primary cluster (xcen,ycen) [in pixels]
d_fake_stars_as= d_fake_stars /arcsec 			; the distance from the center of the primary cluster (xcen,ycen) [in arcsec]
;fake_arr= HIST_ND([1#x_in,1#y_in,1#V_in,1#(V_in-I_in)], [100,100,step_mag,0.25], REVERSE_INDICES=ri_fake_arr)

recovered= WHERE(recovered_flag EQ 1, cntrecov)
flagged= WHERE(recovered_flag EQ 0, cntflagged)

overall_completeness=  FLOAT(cntrecov) / FLOAT(n_elements(x_in))

;;; Computing the usual completeness function
recovered_mags= HISTOGRAM( V_in[recovered], BINSIZE=1, MIN=mags[0], MAX=max_mag )
simulated_mags= HISTOGRAM( V_in, BINSIZE=1, MIN=mags[0], MAX=max_mag )

compl_mags= FLOAT(recovered_mags) / FLOAT(simulated_mags)
compl_mags_err= SQRT( (SQRT(simulated_mags)/simulated_mags)^2 + (SQRT(recovered_mags)/recovered_mags)^2 )  ; the uncertainty of the completeness  compl_mags
windown=windown+1 &    window, windown  &  plot, mags,compl_mags, xticklen=1,yticklen=1, thick=5, xtit="magnitude", ytit="completeness factor", tit="Completeness function"

;;; The completeness function for distance and magnitude
complete_arr= FLTARR(n_elements(mags),n_elements(rad)) 	; Creating an empty array to contain the completeness factor
recovered_arr= HIST_ND([1#V_in[recovered], 1#d_fake_stars_as[recovered]], [step_mag, step_r], min=[mags[0],0], max=[max_mag,max_r])
;flagged_arr= HIST_ND([1#V_in[flagged], 1#d_fake_stars_as[flagged]], [step_mag, step_r], min=[mags[0],0], max=[max_mag,max_r])
recovered_arr=recovered_arr[0:n_elements(mags)-1,0:n_elements(rad)-1]
;flagged_arr=flagged_arr[0:n_elements(mags)-1,0:n_elements(rad)-1]
input_stars_arr= HIST_ND([1#V_in, 1#d_fake_stars_as], [step_mag, step_r], min=[mags[0],0], max=[max_mag,max_r])
input_stars_arr=input_stars_arr[0:n_elements(mags)-1,0:n_elements(rad)-1]

complete_arr= FLOAT(recovered_arr) / FLOAT(input_stars_arr)  	; Filling the array with the completeness factor per mag/radial distance
complete_arr_err= SQRT( (SQRT(recovered_arr)/recovered_arr)^2 + (SQRT(input_stars_arr)/input_stars_arr)^2 )  ; the uncertainty of the completeness per mag/radial distance
limit_compl= WHERE( complete_arr LE completeness_limit)		; Limiting the completeness
completeness_arr = complete_arr 				; Copying the array with the completeness
completeness_arr(limit_compl) = 0.0 				; Applying completeness limit
nan_completeness= WHERE ( NOT Float( Finite(completeness_arr) ))   	; finding the NaN values in the completeness
completeness_arr(nan_completeness)=0.0					; giving the NaN-s a completeness value of 0 

completeness_correction= 1./completeness_arr
nans= WHERE ( NOT FLOAT( FINITE(completeness_correction) ))     ; finding the NaN values in the completeness
completeness_correction(nans)=0.0				; giving the NaN-s a completeness value of 0 
complete_arr_err[nans]= 0.0 					; giving the NaN-s of the completeness error value of 0

windown=windown+1 &    window, windown, xsize=1200, ysize=800
multiplot, [(n_elements(rad_fit)-2)/4,n_elements(mags)/4], xgap=0.02, ygap=0.02
plot, mags, complete_arr[*,0], title=STRING(rad_fit[0], format='(f4.1, " arcsec")'), thick=2 , xtit='magnitude', ytit='completeness'
;oplot, mags, completeness_arr[*,0], color=FSC_COLOR("red") 
oplot, mags, (complete_arr[*,0] * completeness_correction[*,0]), color=FSC_COLOR("blue")
oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")
FOR j=1, (n_elements(rad_fit)-2) DO BEGIN  &$
	multiplot &$
	plot, mags, complete_arr[*,j], title=STRING(rad_fit[j],format='(f4.1, " arcsec")'), thick=2 &$
;	oplot, mags, completeness_arr[*,j], color=FSC_COLOR("red") &$
	oplot, mags, (complete_arr[*,j] * completeness_correction[*,j]), color=FSC_COLOR("blue") &$
	oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")  &$
ENDFOR
multiplot, /reset
multiplot,[1,1],/init

n_st_histogram= HIST_2D( mv, d_as, bin2=step_r, bin1=step_mag, min2=0. , max2=max_r, min1=mags[0], max1=max_mag )     ; in arcsec
;;;n_st_histogramam= HIST_2D( mv, d_am, bin2=step_r, bin1=step_mag, min2=0. , max2=max_r, min1=mags[0], max1=max_mag )  ; in arcmin
n_st_histog= n_st_histogram[0:(n_elements(mags)-1),0:(n_elements(rad)-1)] 		;subscripting the array, removing the additional last column and row, created by HIST_2D

MaxMagIndx= MAX(WHERE( compl_mags GE 0.7 ))       ;MAX(WHERE( completeness_correction[*,0] NE 0.0 ))		;Limiting the profiles to the last magnitude of stars that are complete in the center!!! After that mag the completeness is awful.
 IF MAX(n_st_histog[min(mv)-10,*]) GT 0. THEN  MinMagIndx=FIX(MIN(mv)-10)   ELSE  return

n_st_hist= n_st_histog * completeness_correction                        ; correcting for the incompleteness
n_st_hist[WHERE(mags GE mags[MaxMagIndx])+1 ,*]=0.  			;Limiting the profiles to the magnitude that is complete in the center.


;below we compute the DENSITY and the PROFILES 
print, 'Center at: x,y [pixels]', xcena, ycena
areas=RAD_AREAS_ASEC_NOCYCLE(x,y, xcena, ycena, rad, arcsec)	;here we compute the areas corresponding to each ring in arcseconds
areasec=areas[0,*] & areasec_expected=areas[1,*]
areamin= areasec / ((60.)^2) 	&    areamin_expected= areasec_expected / ((60.)^2)	;here we compute the areas corresponding to each ring in arcminutes

area=areamin					; Define the areas in [arcsec^2] or [arcmin^2] for the Density computations [stars/arcmin^2]

n_st= FLTARR(n_elements(mags),n_elements(rad))
n_st= n_st_hist					;We define the array, containing the number of stars found in each radial ring and magnitude bin. 

N_st_err= SQRT( N_st) 				;uncertanty of the number of the stars - Poson statistical error

f_n= FLTARR(n_elements(mags),n_elements(rad))	;the DENSITY of the stars, including the background
for i=0, n_elements(mags)-1 do begin
	f_n[i,*]= N_st[i,*]/TRANSPOSE(area)
endfor

f_n_err= FLTARR(n_elements(mags),n_elements(rad))	;uncertanty of the stellar Density
for i=0, n_elements(mags)-1 do begin
	f_n_err[i,*]= N_st_err[i,*]/TRANSPOSE(area)
endfor

;NO background subtraction anymore ! 2009-11-13 We do not reach the background actually.
;b_area=f_n[*,WHERE( rad GE 90 AND rad LE 114) ]			;the area for the estimation of the BACKGROUND is an AREA from 1.5 to 1.9 arcmin away from the cluster's center
;
;b= FLTARR(n_elements(mags),n_elements(rad))		;the background level for each magnitude
;for i=0, n_elements(mags)-1 do begin
;	b[i,*]= MEAN(b_area[i,*])
;endfor
;
;b_err= FLTARR(n_elements(mags),n_elements(rad)) 	;the standard deviation of the background
;for i=0, n_elements(mags)-1 do begin
;	b_err[i,*]=STDDEV(b_area[i,*]) 
;endfor


f=f_n                           ; - b > 0.		;NO background subtraction! the DENSITY of stars, corrected for the background, but positive
				;indx_feq0= WHERE(f EQ 0.)

f_err= f_n_err						;NO background subtraction! 

;f_err= FLTARR(n_elements(mags),n_elements(rad))	 		;uncertanty of the Stellar Density
;for i=0, n_elements(mags)-1 do begin
;	f_err[i,*]= sqrt( (f_n_err[i,*])^2 + (b_err[i,*])^2 )
;endfor
;
;f_err(indx_feq0)=0.0



;------------------------------------------------------------------------------------------------------------

;	 ALL stars at one
N_st_all= TOTAL(n_st, 1) 			  ;combining ALL the stars from ALL the magnitudes per radius

N_st_all_err= SQRT( N_st_all)
f_n_all= N_st_all/transpose(area)
f_n_all_err= N_st_all_err/transpose(area)
; log_f_n_all= alog10(f_n_all)
; log_f_n_all_err= sqrt( f_n_all_err / (2.3 * f_n_all) )
; bg_area_all=f_n_all[WHERE( rad GE 90 AND rad LE 114) ]
; b_all= MEAN(bg_area_all)
; b_all_err=STDDEV(bg_area_all)
f_all= f_n_all  			;- b_all > 0.     ; no background subtraction
f_all_err= f_n_all_err
					;f_all_err= sqrt((f_n_all_err)^2 + (b_all_err)^2 )
;log_f_all= alog10(f_all)
;log_f_all_err= sqrt( f_all_err / (2.3 * f_all) )

;indx_fin_all= WHERE(FLOAT(FINITE(log_f_all)))
indx_to_fit_all= WHERE( f_all[0:n_elements(rad_fit)-1] GT 0.0)         ;we fit the profile up to the region of the background determination (1.5 arcmin) or (the maximum of rad_fit)

;	FITTING the profile for All stars
king2=' P[0]* (  (1./ (sqrt( 1.+ (x/P[1])^2 ) )) - (1./ (sqrt( 1+ (P[2]/P[1])^2 ) )) )^2 '         ;the original King 1962 model
king1=' P[0]* (  (1./ (sqrt( 1.+ (x/P[1])^2 ) )) - (1./ P[2]) )^2 '                                ;the parameter P[2] is the whole root (sqrt( 1+ (P[2]/P[1])^2 ) )
king=' ( P[0]* (  (1./ (sqrt( 1.+ (x/P[1])^2 ) )) - (1./ (sqrt( 1+ (P[2]/P[1])^2 ) )) )^2  ) + P[3]'  ; Fitting the Background level bkg


pinfoking= replicate({limited:[0,0], limits:[0.0D,0.0D]}, 4)		;setting the constrains on the parameters
pinfoking[1].limited[0] = 1
pinfoking[1].limits[0] = 0.0D					; R_c > 0
pinfoking[2].limited[0] = 1
pinfoking[2].limits[0] = 0.0D					; R_t > 0
pinfoking[3].limited[0] = 1
pinfoking[3].limits[0] = 0.0D					; f_bg > 0
 pinfoking[2].limited[1] = 1
 pinfoking[2].limits[1] = 150.0D					; R_t > 0


; starting parameters: f_0=maximum density, r_c=radius at half-maximum, r_t=50 arcsec, f_background=minimum density
;startallk = [MAX(f_all)*1.0D, DOUBLE( rad_fit(MIN(WHERE( f_all LE (MAX(f_all[indx_to_fit_all])-MIN(f_all[indx_to_fit_all]))/2)))), 50.0D, MIN(f_all)]
startallk= [MAX(f_all)*1.0D, 10, 50.D, MIN(f_all)*1.D]
paramsall= MPFITEXPR(king, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], startallk, PERROR=perror_allk, BESTNORM=chi2_allk, DOF=dof_allk, PARINFO=pinfoking)

   f_0_allk= paramsall[0] 	; the Central Density from the fit
   f_0_allk_err= perror_allk[0] * SQRT(chi2_allk / dof_allk)
   
   r_c_allk= paramsall[1]        &        r_c_allk_pc= r_c_allk / parsec
   r_c_allk_err= perror_allk[1] * SQRT(chi2_allk / dof_allk)   &   r_c_allk_pc_err = r_c_allk_err / parsec
   
   r_t_allk= paramsall[2]        &        r_t_allk_pc= r_t_allk / parsec
   r_t_allk_err= perror_allk[2] * SQRT(chi2_allk / dof_allk)   &   r_t_allk_pc_err = r_t_allk_err / parsec

   f_bg_allk= paramsall[3] 	; the Central Density from the fit
   f_bg_allk_err= perror_allk[3] * SQRT(chi2_allk / dof_allk)



;;paramsallking= MPFITEXPR(king1, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], startallk, PERROR=perror_allking, PARINFO=pinfoking) ;
;;
;;   r_t_allking= sqrt( ((paramsallking[2]^2) -1 ) *paramsallking[1]^2 )
;;   r_t_allking_pc= r_t_allk /parsec

pinfoels= replicate({limited:[0,0], limits:[0.D,0]}, 4)		;setting the limits of the parameters
pinfoels[0].limited[0] = 1                                      ; 
pinfoels[0].limits[0] = 0.D                                     ; f_0 > 0 
pinfoels[1].limited[0] = 1                                      ; 
pinfoels[1].limits[0] = 0.D                                     ; a > 0
pinfoels[2].limited[0] = 1                                      ; 
pinfoels[2].limits[0] = 0.D                                     ; gamma > 0
pinfoels[2].limited[1] = 1                                      ; 
pinfoels[2].limits[1] = 10.D                                    ; gamma < 10
pinfoels[3].limited[0] = 1                                      ; 
pinfoels[3].limits[0] = 0.D                                     ; f_bkg > 0


; starting parameters: f_0=maximum density, a=radius at half-maximum, gamma=2, f_background=minimum density
;startall = [max(f_all)*1.0D, DOUBLE( rad_fit(MIN(WHERE( f_all LE (MAX(f_all[indx_to_fit_all])-MIN(f_all[indx_to_fit_all]))/2)))), 2.0D, MIN(f_all)]
startall=  [MAX(f_all)*1.0D, 10, 2.D, MIN(f_all)*1.D]
elson=' P[0]* ( 1.+ ( x/P[1] )^2  )^(-P[2]/2.) + P[3] ' 	; The EFF model with additional parameter for background level (P[3])
elsonbkg=' P[0]* ( 1.+ ( x/P[1] )^2  )^(-P[2]/2.)' 		;The original EFF model
params_els= MPFITEXPR(elson, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], startall, PERROR=perror_all, BESTNORM=chi2_all, DOF=dof_all, NITER=niter_all, PARINFO=pinfoels )   	

   pcerror_all= perror_all * SQRT(chi2_all / dof_all)

   r_core_all= params_els[1] * sqrt( ( 2^(2/params_els[2]) -1 ) )  		; The CORE radius for all stars, in the same units as the radial distance
   r_core_all_parsec=  r_core_all/parsec 					; The CORE radius for all stars, in [parsecs]
   f0_all= params_els[0]       &   f0_all_err= pcerror_all[0]
   eff_a_all= params_els[1]    &   eff_a_all_err= pcerror_all[1]
   gamma_all= params_els[2]    &   gamma_all_err= pcerror_all[2]
   bkg_fitted_all= params_els[3] & bkg_fitted_all_err= pcerror_all[3]

   r_core_all_err= pcerror_all[1] * sqrt( ( 2^(2/pcerror_all[2]) -1 ) )		; The Uncertainty in the estimation [arcsec]
   r_core_all_parsec_err=    r_core_all_err / parsec  				; The Uncertainty in the estimation [arcsec]



startall1 = [max(f_all)*1.0D, 20.0D, 2.0D]
elson1=' P[0]* ( 1.+ ( x/P[1] )^2  )^(-P[2]/2.)'
params_els1= MPFITEXPR(elson1, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], startall1)   	
oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(elson1, rad_fit[indx_to_fit_all], params_els1) , color=FSC_COLOR("crimson"), thick=2 	; Plot model


; ;;; Subtracting the Fitted Background
; f_allbkg= f_n_all - bkg_fitted_all > 0.     ; background subtraction
; f_allbkg_err= SQRT((f_n_all_err)^2 + (bkg_fitted_all_err)^2 )
; indx_to_fit_allbkg= WHERE( f_all[0:n_elements(rad_fit)-1] GT 0.0)
; 
; startallbkg = [max(f_allbkg)*1.0D, 20.0D, 2.0D]
; params_elsbkg= MPFITEXPR(elsonbkg, rad_fit(indx_to_fit_allbkg), f_allbkg(indx_to_fit_allbkg), f_allbkg_err(indx_to_fit_allbkg), startallbkg)   	
;    r_core_allbkg= params_elsbkg[1] * sqrt( ( 2^(2/params_elsbkg[2]) -1 ) )  		; The CORE radius for all stars, in the same units as the radial distance




; windown=windown+1 &    window, 0
; ploterror, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], psym=2, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1, $
;            yrange=[10.0, max(f_all)], YTickFormat='exponent_labels', XTickFormat="(g0)", xtit='radial distance [arcsec]', ytit='density [stars/arcmin!u2!n]', tit='bootstrap errors' 
; ; My Bootstrap method
; Nsamp=1000
; tmpall = fltarr(n_elements(startall),nsamp)  &  indxall=intarr(n_elements(rad_fit[indx_to_fit_all])-1,nsamp)  &  all_iterations=intarr(nsamp)
; FOR i=0l, nsamp-1 DO BEGIN 		&$
;     ind = indx_to_fit_all[ Random_Indices(n_elements(indx_to_fit_all), n_elements(indx_to_fit_all)-1)]              	&$  		
;     indxall[*,i]=ind 								  	&$
;     tmpall[*,i]=  MPFITEXPR(elson, rad_fit[ind], f_all[ind], f_all_err[ind], startall, PARINFO=pinfoels, NITER=niter_allb, /QUIET)   &$
;     all_iterations[i]= niter_allb 		&$
;     oplot, rad_fit[ind] ,MPEVALEXPR(elson, rad_fit[ind], tmpall[*,i]),  thick=1 &$
; ENDFOR
; 
; boot_f0= tmpall[0,*]    & boot_f0_err= STDDEV(boot_f0)
; boot_f_bkg= tmpall[3,*] & boot_f_bkg_err= STDDEV(boot_f_bkg)
; boot_a=  tmpall[1,*]    & boot_a_err=  STDDEV(boot_a)
; boot_gamma= tmpall[2,*] & boot_gamma_err=STDDEV(boot_gamma)
; boot_Rc= boot_a * sqrt( ( 2^(2/boot_gamma) -1 ) )  & boot_Rc_err= STDDEV(boot_Rc)
; boot_Rc_parsec= boot_Rc/parsec  & boot_Rc_err_parsec= STDDEV(boot_Rc_parsec)

;printcol, params_els, [MEAN(boot_f0), MEAN( boot_a), MEAN( boot_gamma)], [ STDDEV(boot_f0), STDDEV(boot_a), STDDEV(boot_gamma)]


windown=windown+1 &    window, windown, xsize=500, ysize=500, tit='Fitted All stars king'
ploterror, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], psym=2, $
	 yrange=[min(f_all), max(f_all)], YTickFormat='exponent_labels', XTickFormat="(g0)", xtit='radial distance [arcsec]', ytit='density [stars/arcmin!u2!n]', tit='RDP for the cluster '+cluster_name,  /XLOG, /YLOG 
oplot, FINDGEN(r_t_allk), MPEVALEXPR(king, FINDGEN(r_t_allk), paramsall) , thick=2, color=FSC_COLOR("ForestGreen")       	; Plot model
ARROW, r_c_allk, MIN(f_all),   r_c_allk, MEAN(f_all), /DATA, color=FSC_COLOR("ForestGreen")
xyouts, 60, MAX(f_all)/1.0,   "King Rc", color=FSC_COLOR("ForestGreen")


; BACKGROUND for all stars
windown=windown+1 &    window, windown
ploterror, rad_fit, f_n_all, f_n_all_err, psym=2, xtit='radius [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]"), tit=cluster_name+' NDP'
;oplot, rad, replicate(min(f_n_all),n_elements(rad)), thick=1, color=150
oplot, findgen(max_rad_fit), MPEVALEXPR(king, findgen(max_rad_fit), paramsall) , thick=2, color=FSC_COLOR("blue")                	; Plot model
oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(elson, rad_fit[indx_to_fit_all], params_els) , color=FSC_COLOR("red"), thick=2 			; Plot model
oplot, rad_fit, REPLICATE(f_bg_allk, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
xyouts, max_rad_fit, max(f_all)/1.0, "King model", color=FSC_COLOR("blue")
xyouts, max_rad_fit, max(f_all)/1.1, "EFF model", color=FSC_COLOR("red")
ARROW, r_c_allk, MIN(f_all),   r_c_allk, MEAN(f_all), /DATA, color=FSC_COLOR("blue")
ARROW, r_core_all, MIN(f_all), r_core_all, MEAN(f_all), /DATA, color=FSC_COLOR("red")
ARROW, eff_a_all, MIN(f_all),  eff_a_all, MEAN(f_all), /DATA, color=FSC_COLOR("ForestGreen")
xyouts, 60, MAX(f_all)/1.0,   "King Rc", color=FSC_COLOR("blue")
xyouts, 60, MAX(f_all)/1.1, "EFF Rc", color=FSC_COLOR("red")
xyouts, 60, MAX(f_all)/1.2,  "EFF a", color=FSC_COLOR("ForestGreen")



; *****************************************************************************************************
; 	BRIGHT and FAINT stars 
N_st_br= total(n_st[[WHERE(mags LT 20)],*],1) 	      		; 10 - 20 mag the bright stars
N_st_br_err= sqrt( N_st_br)
f_n_br= N_st_br/transpose(area)
f_n_br_err= N_st_br_err/transpose(area)
		;bg_area_br=f_n_br[WHERE( rad GE 90 AND rad LE 114) ]
		;b_br= mean(bg_area_br)
		;b_br_err=STDDEV(bg_area_br)
f_br= f_n_br 				;- b_br  > 0.
f_br_err=f_n_br_err
					;f_br_err= sqrt((f_n_br_err)^2 + (b_err)^2 )
;log_f_br= alog10(f_br)
;log_f_br_err= sqrt( f_br_err / (2.3 * f_br) )

indx_to_fit_br= WHERE( f_br[0:n_elements(rad_fit)-1] GT 0.0)	

startbr = [max(f_br)*1.0D, startall[1], 2.0D, MIN(f_br)]
startbrk = [MAX(f_br)*1.0D, 10.0D, 50.0D, MIN(f_br)]


;; paramsbr= MPFITEXPR(elson, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], startbr, PERROR=perror_br, BESTNORM=chi2_br, DOF=dof_br, NITER=niter_br, PARINFO=pinfoels) 	;fitting the profile
;; 
;;    pcerror_br= perror_br * SQRT(chi2_br / dof_br)
;; 
;;    r_core_br= paramsbr[1] * sqrt( ( 2^(2/paramsbr[2]) -1 ) )  		; The CORE radius for bright stars, [units as rad]
;;    r_core_br_parsec=  r_core_br/parsec 					; The CORE radius for bright stars, in [parsecs]
;;    f0_br= paramsbr[0]         & f0_br_err= pcerror_br[0]
;;    eff_a_br= paramsbr[1]      & eff_a_br_err= pcerror_br[1]
;;    gamma_br= paramsbr[2]      & gamma_br_err= pcerror_br[2]
;;    bkg_fitted_br= paramsbr[3] & bkg_fitted_br_err= pcerror_br[3]
;; 
;;    r_core_br_err= pcerror_br[1] * sqrt( ( 2^(2/pcerror_br[2]) -1 ) )		; The Uncertainty in the estimation [arcsec]
;;    r_core_br_parsec_err=    r_core_br_err / parsec

paramsbrk= MPFITEXPR(king, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], startbrk, PERROR=perror_brk, BESTNORM=chi2_brk, DOF=dof_brk, NITER=niter_brk, PARINFO=pinfoking) 	;fitting the profile

   pcerror_brk= perror_brk * SQRT(chi2_brk / dof_brk)             ; The scaled uncertainties for the parameters

   f_0_brk= paramsbrk[0] 	; the Central Density from the fit
   f_0_brk_err=  pcerror_brk[0]
   
   r_c_brk= paramsbrk[1]        &        r_c_brk_pc= r_c_brk / parsec
   r_c_brk_err= pcerror_brk[1]  &   r_c_brk_pc_err = r_c_brk_err / parsec
   
   r_t_brk= paramsbrk[2]        &        r_t_brk_pc= r_t_brk / parsec
   r_t_brk_err= pcerror_brk[2] &   r_t_brk_pc_err = r_t_brk_err / parsec

   f_bg_brk= paramsbrk[3] 	 ; the Background Density from the fit
   f_bg_brk_err= pcerror_brk[3]


N_st_fa= total(n_st[[WHERE(mags GE 20)],*],1)		        ; 20 - 29 mag the faint stars
N_st_fa_err= sqrt( N_st_fa)
f_n_fa= N_st_fa/transpose(area)
f_n_fa_err= N_st_fa_err/transpose(area)
;bg_area_fa=f_n_fa[WHERE( rad GE 90 AND rad LE 114) ]
;b_fa= mean(bg_area_fa)
;b_fa_err=STDDEV(bg_area_fa)
f_fa= f_n_fa 				;- b_fa > 0.
f_fa_err=f_n_fa_err
					;f_fa_err= sqrt((f_n_fa_err)^2 + (b_err)^2 )
;log_f_fa= alog10(f_fa)
;log_f_fa_err= sqrt( f_fa_err / (2.3 * f_fa) )

indx_to_fit_fa= WHERE( f_fa[0:n_elements(rad_fit)-1] GT 0.0)

startfa = [max(f_fa)*1.0D, startall[1], 2.0D, MIN(f_fa)]
startfak = [MAX(f_fa)*1.0D, 10.0D, 50.0D, MIN(f_fa)]

;; paramsfa= MPFITEXPR(elson, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], startfa, PERROR=perror_fa, BESTNORM=chi2_fa, DOF=dof_fa, NITER=niter_fa, PARINFO=pinfoels) 	;fitting the profile
;;    
;;    pcerror_fa= perror_fa * SQRT(chi2_fa / dof_fa)
;; 
;;    r_core_fa= paramsfa[1] * sqrt( ( 2^(2/paramsfa[2]) -1 ) )  		; The CORE radius for faint stars, [units as rad]
;;    r_core_fa_parsec=  r_core_fa/parsec 					; The CORE radius for faint stars, in [parsecs]
;;    f0_fa= paramsfa[0]         & f0_fa_err= pcerror_fa[0]
;;    eff_a_fa= paramsfa[1]      & eff_a_fa_err= pcerror_fa[1]
;;    gamma_fa= paramsfa[2]      & gamma_fa_err= pcerror_fa[2]
;;    bkg_fitted_fa= paramsfa[3] & bkg_fitted_fa_err= pcerror_fa[3]
;; 
;;    r_core_fa_err= pcerror_fa[1] * sqrt( ( 2^(2/pcerror_fa[2]) -1 ) )	; The Uncertainty in the estimation [arcsec]
;;    r_core_fa_parsec_err=    r_core_fa_err / parsec

paramsfak= MPFITEXPR(king, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], startfak, PERROR=perror_fak, BESTNORM=chi2_fak, DOF=dof_fak, NITER=niter_fak, PARINFO=pinfoking) 	;fitting the profile

   pcerror_fak= perror_fak * SQRT(chi2_fak / dof_fak)             ; the Central Density from the fit

   f_0_fak= paramsfak[0] 	; the Central Density from the fit
   f_0_fak_err=  pcerror_fak[0]
   
   r_c_fak= paramsfak[1]        &        r_c_fak_pc= r_c_fak / parsec
   r_c_fak_err= pcerror_fak[1]  &   r_c_fak_pc_err = r_c_fak_err / parsec
   
   r_t_fak= paramsfak[2]        &        r_t_fak_pc= r_t_fak / parsec
   r_t_fak_err= pcerror_fak[2] &   r_t_fak_pc_err = r_t_fak_err / parsec

   f_bg_fak= paramsfak[3] 	; the Background Density from the fit
   f_bg_fak_err= pcerror_fak[3]

;;;  Subtracting the Fitted Background
; f_brbkg= f_n_br - bkg_fitted_br > 0.     ; background subtraction
; f_brbkg_err= sqrt((f_n_br_err)^2 + (bkg_fitted_br_err)^2 )
; indx_to_fit_brbkg= WHERE( f_br[0:n_elements(rad_fit)-1] GT 0.0)
; startbrbkg = [max(f_brbkg)*1.0D, DOUBLE( rad_fit(MIN(WHERE( f_brbkg LE (MAX(f_brbkg[indx_to_fit_brbkg])-MIN(f_brbkg[indx_to_fit_brbkg]))/2)))), 2.0D]
; paramsbrbkg= MPFITEXPR(elsonbkg, rad_fit(indx_to_fit_brbkg), f_brbkg(indx_to_fit_brbkg), f_brbkg_err(indx_to_fit_brbkg), startbrbkg)   	
;    r_core_brbkg= paramsbrbkg[1] * sqrt( ( 2^(2/paramsbrbkg[2]) -1 ) )  		; The CORE radius for all stars, in the same units as the radial distance
; 
; f_fabkg= f_n_fa - bkg_fitted_fa > 0.     ; background subtraction
; f_fabkg_err= sqrt((f_n_fa_err)^2 + (bkg_fitted_fa_err)^2 )
; indx_to_fit_fabkg= WHERE( f_fa[0:n_elements(rad_fit)-1] GT 0.0)
; startfabkg = [max(f_fabkg)*1.0D, DOUBLE( rad_fit(MIN(WHERE( f_fabkg LE (MAX(f_fabkg[indx_to_fit_fabkg])-MIN(f_fabkg[indx_to_fit_fabkg]))/2)))), 2.0D]
; paramsfabkg= MPFITEXPR(elsonbkg, rad_fit(indx_to_fit_fabkg), f_fabkg(indx_to_fit_fabkg), f_fabkg_err(indx_to_fit_fabkg), startfabkg)   	
;    r_core_fabkg= paramsfabkg[1] * sqrt( ( 2^(2/paramsfabkg[2]) -1 ) )  		; The CORE radius for all stars, in the same units as the radial distance


; windown=windown+1 &    window, 0
; ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=4, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1, $
; 		yrange=[10.0, max(f_all)], YTickFormat='exponent_labels', tit='Bootstrap Bright and Faint', ytit=TeXtoIDL("density [stars/arcmin^2]")
; oploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=6
; 
; ; My Bootstrap method   
; tmpbr = fltarr(n_elements(startbr),nsamp)  &  indxbr=intarr(n_elements(rad_fit[indx_to_fit_br])-1,nsamp)  &  br_iterations=intarr(nsamp)
; FOR i=0l, nsamp-1 DO BEGIN 		  &$
;     indbr = indx_to_fit_br[Random_Indices(n_elements(indx_to_fit_br), n_elements(indx_to_fit_br)-1)]              	&$  		
;     indxbr[*,i]=indbr 			  &$
;     tmpbr[*,i]=  MPFITEXPR(elson, rad_fit[indbr], f_br[indbr], f_br_err[indbr], startbr, PARINFO=pinfoels, NITER=niter_brb, /QUIET)   &$
;     br_iterations[i]= niter_brb  		&$
;     oplot, rad_fit[ind] ,MPEVALEXPR(elson, rad_fit[ind], tmpbr[*,i]),  thick=1 &$
; ENDFOR
; boot_f0br= tmpbr[0,*]    & boot_f0br_err= STDDEV(boot_f0br)
; boot_fbr_bkg= tmpbr[3,*] & boot_fbr_bkg_err= STDDEV(boot_fbr_bkg)
; boot_abr=  tmpbr[1,*]    & boot_abr_err=  STDDEV(boot_abr)
; boot_gammabr= tmpbr[2,*] & boot_gammabr_err=STDDEV(boot_gammabr)
; boot_Rcbr= boot_abr * sqrt( ( 2^(2/boot_gammabr) -1 ) )  & boot_Rcbr_err= STDDEV(boot_Rcbr)
; boot_Rcbr_parsec= boot_Rcbr/parsec  & boot_Rcbr_err_parsec= STDDEV(boot_Rcbr_parsec)
; ;printcol, paramsbr, [MEAN(boot_f0br), MEAN(boot_abr), MEAN(boot_gammabr)], [ STDDEV(boot_f0br), STDDEV(boot_abr), STDDEV(boot_gammabr)]
; 
; tmpfa = fltarr(n_elements(startfa),nsamp)  &  indxfa=intarr(n_elements(rad_fit[indx_to_fit_fa])-1,nsamp)  &  fa_iterations=intarr(nsamp)
; FOR i=0l, nsamp-1 DO BEGIN 		  &$
;     indfa = indx_to_fit_fa[ Random_Indices(n_elements(indx_to_fit_fa), n_elements(indx_to_fit_fa)-1)]              	&$  		
;     indxfa[*,i]=indfa 	&$
;     tmpfa[*,i]=  MPFITEXPR(elson, rad_fit[indfa], f_fa[indfa], f_fa_err[indfa], startfa, PARINFO=pinfoels, NITER=niter_fab, /QUIET)   &$
;     fa_iterations[i]= niter_fab  		&$
;     oplot, rad_fit[indfa] ,MPEVALEXPR(elson, rad_fit[indfa], tmpfa[*,i]),  thick=1 &$
; ENDFOR
; boot_f0fa= tmpfa[0,*]    & boot_f0fa_err= STDDEV(boot_f0fa)
; boot_ffa_bkg= tmpfa[3,*] & boot_ffa_bkg_err= STDDEV(boot_ffa_bkg)
; boot_afa=  tmpfa[1,*]    & boot_afa_err=  STDDEV(boot_afa)
; boot_gammafa= tmpfa[2,*] & boot_gammafa_err=STDDEV(boot_gammafa)
; boot_Rcfa= boot_afa * sqrt( ( 2^(2/boot_gammafa) -1 ) )  & boot_Rcfa_err= STDDEV(boot_Rcfa)
; boot_Rcfa_parsec= boot_Rcfa/parsec  & boot_Rcfa_err_parsec= STDDEV(boot_Rcfa_parsec)
; ;printcol, paramsfa, [MEAN(boot_f0fa), MEAN(boot_afa), MEAN(boot_gammafa)], [ STDDEV(boot_f0fa), STDDEV(boot_afa), STDDEV(boot_gammafa)]



windown=windown+1 &    window, windown ,xsize=400, ysize=700, title='Bright and Faint stars'
multiplot, [1,2], ygap=0.02
ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=4, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r],  $ 
 		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit='Bright stars V < 20', ytit=TeXtoIDL("density [stars/arcmin^2]")
oplot, FINDGEN(r_t_brk), MPEVALEXPR(king , FINDGEN(r_t_brk), paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=6, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], $ 
		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit=TeXtoIDL("Faint stars 20 \leq V \leq 25"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
oplot, FINDGEN(r_t_fak), MPEVALEXPR(king , FINDGEN(r_t_fak), paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
multiplot, /reset
multiplot,[1,1],/init

; windown=windown+1 &    window, windown,xsize=400, ysize=700, title='_Bright and Faint stars'
; !p.multi=[0,1,2,0,0]
; multiplot, ygap=0.02
; ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=4, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1 , $
;  		YTickFormat='exponent_labels' , tit='Bright stars V < 20 mag', ytit=TeXtoIDL("density [stars/arcmin^2]")
; oplot, rad_fit[indx_to_fit_br], MPEVALEXPR(king , rad_fit[indx_to_fit_br], paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
; oplot, rad_fit, REPLICATE(f_bg_brk, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
; multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=6, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1, $ 
;  		YTickFormat='exponent_labels', XTickFormat="(g0)", tit=TeXtoIDL("Faint stars V \geq 20 mag"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
; oploterror, rad_fit(indx_to_fit_fabkg), f_fabkg(indx_to_fit_fabkg), f_fabkg_err(indx_to_fit_fabkg), psym=5, color=FSC_COLOR("DeepPink")
; oplot,      rad_fit(indx_to_fit_fabkg), MPEVALEXPR(elsonbkg, rad_fit(indx_to_fit_fabkg), paramsfabkg) , color=FSC_COLOR("DeepPink"), thick=2 	; Plot model
; oplot, rad_fit[indx_to_fit_fa], MPEVALEXPR(king , rad_fit[indx_to_fit_fa], paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
; oplot, rad_fit, REPLICATE(f_bg_fak, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
; multiplot, /reset
; multiplot,[1,1],/init

print, '---------Core Radius: _all, _br, _fa   and errors below'
print, [[r_c_allk, r_c_brk, r_c_fak],[r_c_allk_err, r_c_brk_err, r_c_fak_err]]
print, '---------Tidal Radius: _all, _br, _fa   and errors below'
print, [[r_t_allk, r_t_brk, r_t_fak],[r_t_allk_err, r_t_brk_err, r_t_fak_err]]


; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;   Profile fitting for each magnitude separately
;; f= f[*,WHERE( rad le 90 )] 		
;; f_err=f_err[*,WHERE( rad le 90 )]  	; IF we subtract background THEN we cut the profile to the distance of background determination.
startsk= [MAX(f)*1.0D, 10.0D, 50.0D, MIN(f(WHERE(f GT 0.)))]

paramsmagking= DBLARR(n_elements(mags), n_elements(startsk))  		;here we create the vectors to contain the fitted parameters
perror_magsk= DBLARR(n_elements(mags), n_elements(startsk))
chi2_magsk= DBLARR(n_elements(mags))
dof_magsk= DBLARR(n_elements(mags))
niter_magsk= INTARR(n_elements(mags))

gt0= f < 1 					; the array is 0 where f is 0 and 1 where F is GT 0
cntsm=TOTAL(gt0,2) 				; count of non-zeros in F (vector, n_elements(mags))

indx10m_gt0= WHERE( f[ 0,0:n_elements(rad_fit)-1] GT 0.0, cnt10m)	;subscripting - selecting only the values of F that are positive for each magnitude
indx11m_gt0= WHERE( f[ 1,0:n_elements(rad_fit)-1] GT 0.0, cnt11m)
indx12m_gt0= WHERE( f[ 2,0:n_elements(rad_fit)-1] GT 0.0, cnt12m)
indx13m_gt0= WHERE( f[ 3,0:n_elements(rad_fit)-1] GT 0.0, cnt13m)
indx14m_gt0= WHERE( f[ 4,0:n_elements(rad_fit)-1] GT 0.0, cnt14m)
indx15m_gt0= WHERE( f[ 5,0:n_elements(rad_fit)-1] GT 0.0, cnt15m)
indx16m_gt0= WHERE( f[ 6,0:n_elements(rad_fit)-1] GT 0.0, cnt16m)
indx17m_gt0= WHERE( f[ 7,0:n_elements(rad_fit)-1] GT 0.0, cnt17m)
indx18m_gt0= WHERE( f[ 8,0:n_elements(rad_fit)-1] GT 0.0, cnt18m)
indx19m_gt0= WHERE( f[ 9,0:n_elements(rad_fit)-1] GT 0.0, cnt19m)
indx20m_gt0= WHERE( f[10,0:n_elements(rad_fit)-1] GT 0.0, cnt20m)
indx21m_gt0= WHERE( f[11,0:n_elements(rad_fit)-1] GT 0.0, cnt21m)
indx22m_gt0= WHERE( f[12,0:n_elements(rad_fit)-1] GT 0.0, cnt22m)
indx23m_gt0= WHERE( f[13,0:n_elements(rad_fit)-1] GT 0.0, cnt23m)
indx24m_gt0= WHERE( f[14,0:n_elements(rad_fit)-1] GT 0.0, cnt24m)
indx25m_gt0= WHERE( f[15,0:n_elements(rad_fit)-1] GT 0.0, cnt25m)
indx26m_gt0= WHERE( f[16,0:n_elements(rad_fit)-1] GT 0.0, cnt26m)
indx27m_gt0= WHERE( f[17,0:n_elements(rad_fit)-1] GT 0.0, cnt27m)
indx28m_gt0= WHERE( f[18,0:n_elements(rad_fit)-1] GT 0.0, cnt28m)
indx29m_gt0= WHERE( f[19,0:n_elements(rad_fit)-1] GT 0.0, cnt29m)

IF cntsm[ 0] GT 4 THEN  startskmag10=  [ MAX(f[ 0,indx10m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 0,indx10m_gt0]) ]
IF cntsm[ 1] GT 4 THEN  startskmag11=  [ MAX(f[ 1,indx11m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 1,indx11m_gt0]) ]
IF cntsm[ 2] GT 4 THEN  startskmag12=  [ MAX(f[ 2,indx12m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 2,indx12m_gt0]) ]
IF cntsm[ 3] GT 4 THEN  startskmag13=  [ MAX(f[ 3,indx13m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 3,indx13m_gt0]) ]
IF cntsm[ 4] GT 4 THEN  startskmag14=  [ MAX(f[ 4,indx14m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 4,indx14m_gt0]) ]
IF cntsm[ 5] GT 4 THEN  startskmag15=  [ MAX(f[ 5,indx15m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 5,indx15m_gt0]) ]
IF cntsm[ 6] GT 4 THEN  startskmag16=  [ MAX(f[ 6,indx16m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 6,indx16m_gt0]) ]
IF cntsm[ 7] GT 4 THEN  startskmag17=  [ MAX(f[ 7,indx17m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 7,indx17m_gt0]) ]
IF cntsm[ 8] GT 4 THEN  startskmag18=  [ MAX(f[ 8,indx18m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 8,indx18m_gt0]) ]
IF cntsm[ 9] GT 4 THEN  startskmag19=  [ MAX(f[ 9,indx19m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[ 9,indx19m_gt0]) ]
IF cntsm[10] GT 4 THEN  startskmag20= [ MAX(f[10,indx20m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[10,indx20m_gt0]) ]
IF cntsm[11] GT 4 THEN  startskmag21= [ MAX(f[11,indx21m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[11,indx21m_gt0]) ]
IF cntsm[12] GT 4 THEN  startskmag22= [ MAX(f[12,indx22m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[12,indx22m_gt0]) ]
IF cntsm[13] GT 4 THEN  startskmag23= [ MAX(f[13,indx23m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[13,indx23m_gt0]) ]
IF cntsm[14] GT 4 THEN  startskmag24= [ MAX(f[14,indx24m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[14,indx24m_gt0]) ]
IF cntsm[15] GT 4 THEN  startskmag25= [ MAX(f[15,indx25m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[15,indx25m_gt0]) ]
IF cntsm[16] GT 4 THEN  startskmag26= [ MAX(f[16,indx26m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[16,indx26m_gt0]) ]
IF cntsm[17] GT 4 THEN  startskmag27= [ MAX(f[17,indx27m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[17,indx27m_gt0]) ]
IF cntsm[18] GT 4 THEN  startskmag28= [ MAX(f[18,indx28m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[18,indx28m_gt0]) ]
IF cntsm[19] GT 4 THEN  startskmag29= [ MAX(f[19,indx29m_gt0])*1.0D, 10.0D, 50.0D, MIN(f[19,indx29m_gt0]) ]

; we set the limit of at least 4 data points to fit the profile, else => % MPFITEXPR: ERROR: number of parameters must not exceed data
IF cntsm[ 0] GT 4 THEN  paramsmagking[ 0,*]= MPFITEXPR(king, rad_fit[indx10m_gt0], f[ 0,indx10m_gt0], f_err[ 0,indx10m_gt0], startskmag10, PERROR=perror_magsk0,  BESTNORM=chi2_magsk0 , DOF=dof_magsk0 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 0] GT 4 THEN perror_magsk[ 0,*]= perror_magsk0  & IF cntsm[ 0] GT 4 THEN chi2_magsk[ 0]=chi2_magsk0  & IF cntsm[ 0] GT 4 THEN dof_magsk[ 0,*]=dof_magsk0  & IF cntsm[ 0] GT 4 THEN niter_magsk[ 0]=niter_mag 
IF cntsm[ 1] GT 4 THEN  paramsmagking[ 1,*]= MPFITEXPR(king, rad_fit[indx11m_gt0], f[ 1,indx11m_gt0], f_err[ 1,indx11m_gt0], startskmag11, PERROR=perror_magsk1,  BESTNORM=chi2_magsk1 , DOF=dof_magsk1 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 1] GT 4 THEN perror_magsk[ 1,*]= perror_magsk1  & IF cntsm[ 1] GT 4 THEN chi2_magsk[ 1]=chi2_magsk1  & IF cntsm[ 1] GT 4 THEN dof_magsk[ 1,*]=dof_magsk1  & IF cntsm[ 1] GT 4 THEN niter_magsk[ 1]=niter_mag 
IF cntsm[ 2] GT 4 THEN  paramsmagking[ 2,*]= MPFITEXPR(king, rad_fit[indx12m_gt0], f[ 2,indx12m_gt0], f_err[ 2,indx12m_gt0], startskmag12, PERROR=perror_magsk2,  BESTNORM=chi2_magsk2 , DOF=dof_magsk2 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 2] GT 4 THEN perror_magsk[ 2,*]= perror_magsk2  & IF cntsm[ 2] GT 4 THEN chi2_magsk[ 2]=chi2_magsk2  & IF cntsm[ 2] GT 4 THEN dof_magsk[ 2,*]=dof_magsk2  & IF cntsm[ 2] GT 4 THEN niter_magsk[ 2]=niter_mag 
IF cntsm[ 3] GT 4 THEN  paramsmagking[ 3,*]= MPFITEXPR(king, rad_fit[indx13m_gt0], f[ 3,indx13m_gt0], f_err[ 3,indx13m_gt0], startskmag13, PERROR=perror_magsk3,  BESTNORM=chi2_magsk3 , DOF=dof_magsk3 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 3] GT 4 THEN perror_magsk[ 3,*]= perror_magsk3  & IF cntsm[ 3] GT 4 THEN chi2_magsk[ 3]=chi2_magsk3  & IF cntsm[ 3] GT 4 THEN dof_magsk[ 3,*]=dof_magsk3  & IF cntsm[ 3] GT 4 THEN niter_magsk[ 3]=niter_mag 
IF cntsm[ 4] GT 4 THEN  paramsmagking[ 4,*]= MPFITEXPR(king, rad_fit[indx14m_gt0], f[ 4,indx14m_gt0], f_err[ 4,indx14m_gt0], startskmag14, PERROR=perror_magsk4,  BESTNORM=chi2_magsk4 , DOF=dof_magsk4 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 4] GT 4 THEN perror_magsk[ 4,*]= perror_magsk4  & IF cntsm[ 4] GT 4 THEN chi2_magsk[ 4]=chi2_magsk4  & IF cntsm[ 4] GT 4 THEN dof_magsk[ 4,*]=dof_magsk4  & IF cntsm[ 4] GT 4 THEN niter_magsk[ 4]=niter_mag 
IF cntsm[ 5] GT 4 THEN  paramsmagking[ 5,*]= MPFITEXPR(king, rad_fit[indx15m_gt0], f[ 5,indx15m_gt0], f_err[ 5,indx15m_gt0], startskmag15, PERROR=perror_magsk5,  BESTNORM=chi2_magsk5 , DOF=dof_magsk5 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 5] GT 4 THEN perror_magsk[ 5,*]= perror_magsk5  & IF cntsm[ 5] GT 4 THEN chi2_magsk[ 5]=chi2_magsk5  & IF cntsm[ 5] GT 4 THEN dof_magsk[ 5,*]=dof_magsk5  & IF cntsm[ 5] GT 4 THEN niter_magsk[ 5]=niter_mag 
IF cntsm[ 6] GT 4 THEN  paramsmagking[ 6,*]= MPFITEXPR(king, rad_fit[indx16m_gt0], f[ 6,indx16m_gt0], f_err[ 6,indx16m_gt0], startskmag16, PERROR=perror_magsk6,  BESTNORM=chi2_magsk6 , DOF=dof_magsk6 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 6] GT 4 THEN perror_magsk[ 6,*]= perror_magsk6  & IF cntsm[ 6] GT 4 THEN chi2_magsk[ 6]=chi2_magsk6  & IF cntsm[ 6] GT 4 THEN dof_magsk[ 6,*]=dof_magsk6  & IF cntsm[ 6] GT 4 THEN niter_magsk[ 6]=niter_mag 
IF cntsm[ 7] GT 4 THEN  paramsmagking[ 7,*]= MPFITEXPR(king, rad_fit[indx17m_gt0], f[ 7,indx17m_gt0], f_err[ 7,indx17m_gt0], startskmag17, PERROR=perror_magsk7,  BESTNORM=chi2_magsk7 , DOF=dof_magsk7 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 7] GT 4 THEN perror_magsk[ 7,*]= perror_magsk7  & IF cntsm[ 7] GT 4 THEN chi2_magsk[ 7]=chi2_magsk7  & IF cntsm[ 7] GT 4 THEN dof_magsk[ 7,*]=dof_magsk7  & IF cntsm[ 7] GT 4 THEN niter_magsk[ 7]=niter_mag 
IF cntsm[ 8] GT 4 THEN  paramsmagking[ 8,*]= MPFITEXPR(king, rad_fit[indx18m_gt0], f[ 8,indx18m_gt0], f_err[ 8,indx18m_gt0], startskmag18, PERROR=perror_magsk8,  BESTNORM=chi2_magsk8 , DOF=dof_magsk8 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 8] GT 4 THEN perror_magsk[ 8,*]= perror_magsk8  & IF cntsm[ 8] GT 4 THEN chi2_magsk[ 8]=chi2_magsk8  & IF cntsm[ 8] GT 4 THEN dof_magsk[ 8,*]=dof_magsk8  & IF cntsm[ 8] GT 4 THEN niter_magsk[ 8]=niter_mag 
IF cntsm[ 9] GT 4 THEN  paramsmagking[ 9,*]= MPFITEXPR(king, rad_fit[indx19m_gt0], f[ 9,indx19m_gt0], f_err[ 9,indx19m_gt0], startskmag19, PERROR=perror_magsk9,  BESTNORM=chi2_magsk9 , DOF=dof_magsk9 , NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[ 9] GT 4 THEN perror_magsk[ 9,*]= perror_magsk9  & IF cntsm[ 9] GT 4 THEN chi2_magsk[ 9]=chi2_magsk9  & IF cntsm[ 9] GT 4 THEN dof_magsk[ 9,*]=dof_magsk9  & IF cntsm[ 9] GT 4 THEN niter_magsk[ 9]=niter_mag 
IF cntsm[10] GT 4 THEN  paramsmagking[10,*]= MPFITEXPR(king, rad_fit[indx20m_gt0], f[10,indx20m_gt0], f_err[10,indx20m_gt0], startskmag20, PERROR=perror_magsk10, BESTNORM=chi2_magsk10, DOF=dof_magsk10, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[10] GT 4 THEN perror_magsk[10,*]= perror_magsk10 & IF cntsm[10] GT 4 THEN chi2_magsk[10]=chi2_magsk10 & IF cntsm[10] GT 4 THEN dof_magsk[10,*]=dof_magsk10 & IF cntsm[10] GT 4 THEN niter_magsk[10]=niter_mag 
IF cntsm[11] GT 4 THEN  paramsmagking[11,*]= MPFITEXPR(king, rad_fit[indx21m_gt0], f[11,indx21m_gt0], f_err[11,indx21m_gt0], startskmag21, PERROR=perror_magsk11, BESTNORM=chi2_magsk11, DOF=dof_magsk11, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[11] GT 4 THEN perror_magsk[11,*]= perror_magsk11 & IF cntsm[11] GT 4 THEN chi2_magsk[11]=chi2_magsk11 & IF cntsm[11] GT 4 THEN dof_magsk[11,*]=dof_magsk11 & IF cntsm[11] GT 4 THEN niter_magsk[11]=niter_mag 
IF cntsm[12] GT 4 THEN  paramsmagking[12,*]= MPFITEXPR(king, rad_fit[indx22m_gt0], f[12,indx22m_gt0], f_err[12,indx22m_gt0], startskmag22, PERROR=perror_magsk12, BESTNORM=chi2_magsk12, DOF=dof_magsk12, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[12] GT 4 THEN perror_magsk[12,*]= perror_magsk12 & IF cntsm[12] GT 4 THEN chi2_magsk[12]=chi2_magsk12 & IF cntsm[12] GT 4 THEN dof_magsk[12,*]=dof_magsk12 & IF cntsm[12] GT 4 THEN niter_magsk[12]=niter_mag 
IF cntsm[13] GT 4 THEN  paramsmagking[13,*]= MPFITEXPR(king, rad_fit[indx23m_gt0], f[13,indx23m_gt0], f_err[13,indx23m_gt0], startskmag23, PERROR=perror_magsk13, BESTNORM=chi2_magsk13, DOF=dof_magsk13, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[13] GT 4 THEN perror_magsk[13,*]= perror_magsk13 & IF cntsm[13] GT 4 THEN chi2_magsk[13]=chi2_magsk13 & IF cntsm[13] GT 4 THEN dof_magsk[13,*]=dof_magsk13 & IF cntsm[13] GT 4 THEN niter_magsk[13]=niter_mag 
IF cntsm[14] GT 4 THEN  paramsmagking[14,*]= MPFITEXPR(king, rad_fit[indx24m_gt0], f[14,indx24m_gt0], f_err[14,indx24m_gt0], startskmag24, PERROR=perror_magsk14, BESTNORM=chi2_magsk14, DOF=dof_magsk14, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[14] GT 4 THEN perror_magsk[14,*]= perror_magsk14 & IF cntsm[14] GT 4 THEN chi2_magsk[14]=chi2_magsk14 & IF cntsm[14] GT 4 THEN dof_magsk[14,*]=dof_magsk14 & IF cntsm[14] GT 4 THEN niter_magsk[14]=niter_mag 
IF cntsm[15] GT 4 THEN  paramsmagking[15,*]= MPFITEXPR(king, rad_fit[indx25m_gt0], f[15,indx25m_gt0], f_err[15,indx25m_gt0], startskmag25, PERROR=perror_magsk15, BESTNORM=chi2_magsk15, DOF=dof_magsk15, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[15] GT 4 THEN perror_magsk[15,*]= perror_magsk15 & IF cntsm[15] GT 4 THEN chi2_magsk[15]=chi2_magsk15 & IF cntsm[15] GT 4 THEN dof_magsk[15,*]=dof_magsk15 & IF cntsm[15] GT 4 THEN niter_magsk[15]=niter_mag 
IF cntsm[16] GT 4 THEN  paramsmagking[16,*]= MPFITEXPR(king, rad_fit[indx26m_gt0], f[16,indx26m_gt0], f_err[16,indx26m_gt0], startskmag26, PERROR=perror_magsk16, BESTNORM=chi2_magsk16, DOF=dof_magsk16, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[16] GT 4 THEN perror_magsk[16,*]= perror_magsk16 & IF cntsm[16] GT 4 THEN chi2_magsk[16]=chi2_magsk16 & IF cntsm[16] GT 4 THEN dof_magsk[16,*]=dof_magsk16 & IF cntsm[16] GT 4 THEN niter_magsk[16]=niter_mag 
IF cntsm[17] GT 4 THEN  paramsmagking[17,*]= MPFITEXPR(king, rad_fit[indx27m_gt0], f[17,indx27m_gt0], f_err[17,indx27m_gt0], startskmag27, PERROR=perror_magsk17, BESTNORM=chi2_magsk17, DOF=dof_magsk17, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[17] GT 4 THEN perror_magsk[17,*]= perror_magsk17 & IF cntsm[17] GT 4 THEN chi2_magsk[17]=chi2_magsk17 & IF cntsm[17] GT 4 THEN dof_magsk[17,*]=dof_magsk17 & IF cntsm[17] GT 4 THEN niter_magsk[17]=niter_mag 
IF cntsm[18] GT 4 THEN  paramsmagking[18,*]= MPFITEXPR(king, rad_fit[indx28m_gt0], f[18,indx28m_gt0], f_err[18,indx28m_gt0], startskmag28, PERROR=perror_magsk18, BESTNORM=chi2_magsk18, DOF=dof_magsk18, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[18] GT 4 THEN perror_magsk[18,*]= perror_magsk18 & IF cntsm[18] GT 4 THEN chi2_magsk[18]=chi2_magsk18 & IF cntsm[18] GT 4 THEN dof_magsk[18,*]=dof_magsk18 & IF cntsm[18] GT 4 THEN niter_magsk[18]=niter_mag 
IF cntsm[19] GT 4 THEN  paramsmagking[19,*]= MPFITEXPR(king, rad_fit[indx29m_gt0], f[19,indx29m_gt0], f_err[19,indx29m_gt0], startskmag29, PERROR=perror_magsk19, BESTNORM=chi2_magsk19, DOF=dof_magsk19, NITER=niter_mag, PARINFO=pinfoking) & IF cntsm[19] GT 4 THEN perror_magsk[19,*]= perror_magsk19 & IF cntsm[19] GT 4 THEN chi2_magsk[19]=chi2_magsk19 & IF cntsm[19] GT 4 THEN dof_magsk[19,*]=dof_magsk19 & IF cntsm[19] GT 4 THEN niter_magsk[19]=niter_mag 

;   pcerror_mag= perror_magsk * SQRT(chi2_magsk / dof_magsk)             ; The scaled uncertainties for the parameters

   f_0_mag= paramsmagking[*,0] 	; the Central Density from the fit ; type: vector, nelements(mag)
   f_0_mag_err=  perror_magsk[*,0] * SQRT(chi2_magsk / dof_magsk)   
   
   r_c_mag= paramsmagking[*,1]                                &        r_c_mag_pc= r_c_mag / parsec
   r_c_mag_err=  perror_magsk[*,1] * SQRT(chi2_magsk / dof_magsk)  &   r_c_mag_pc_err = r_c_mag_err / parsec
   
   r_t_mag= paramsmagking[*,2]                                &        r_t_mag_pc= r_t_mag / parsec
   r_t_mag_err=  perror_magsk[*,2] * SQRT(chi2_magsk / dof_magsk)  &   r_t_mag_pc_err = r_t_mag_err / parsec

   f_bg_mag= paramsmagking[*,3] 	 ; the Background Density from the fit 	; type: vector, nelements(mag)
   f_bg_mag_err= perror_magsk[*,3] * SQRT(chi2_magsk / dof_magsk) 


windown=windown+1 &    window, windown, xsize=400, ysize=400   ; Core radii
ploterror, (0.5*step_mag+mags[1:*]), r_c_mag[1:*], REPLICATE(0.5,n_elements(mags[1:*])), r_c_mag_err[1:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The core radii for ")+cluster_name
oploterror, [17.5], [r_c_brk], [2.5],[r_c_brk_err], psym=5, thick=1, ERRCOLOR=FSC_COLOR("blue")
oploterror, [22.5], [r_c_fak], [2.5],[r_c_fak_err], psym=4, thick=1, ERRCOLOR=FSC_COLOR("red")
oploterror, [20.0], [r_c_allk],[5.0],[r_c_allk_err], psym=6, thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")

windown=windown+1 &    window, windown, xsize=400, ysize=400   ; Tidal radii
ploterror, (0.5*step_mag+mags[1:*]), r_t_mag[1:*], REPLICATE(0.5,n_elements(mags[1:*])), r_t_mag_err[1:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 150], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The tidal radii for ")+cluster_name
oploterror, [17.5], [r_t_brk], [2.5],[r_t_brk_err], psym=5, thick=1, ERRCOLOR=FSC_COLOR("blue")
oploterror, [22.5], [r_t_fak], [2.5],[r_t_fak_err], psym=4, thick=1, ERRCOLOR=FSC_COLOR("red")
oploterror, [20.0], [r_t_allk],[5.0],[r_t_allk_err], psym=6, thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")

windown=windown+1 &    window, windown, xsize=800, ysize=800        ;plotting RDPs 
multiplot, [3,4], ygap=0.02, xgap=0.04
magindx=  1          
IF cntsm[ 1] GT 4 THEN plot, rad_fit[indx11m_gt0], f[1,indx11m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[1], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 1] GT 4 THEN oploterror, rad_fit[indx11m_gt0], f[1,indx11m_gt0], f_err[1,indx11m_gt0], psym=2
IF cntsm[ 1] GT 4 THEN oplot, FINDGEN(r_t_mag[ 1]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 1]), paramsmagking[1,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 2] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 2] GT 4 THEN plot, rad_fit[indx12m_gt0], f[2,indx12m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[2], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 2] GT 4 THEN oploterror, rad_fit[indx12m_gt0], f[2,indx12m_gt0], f_err[2,indx12m_gt0], psym=2
IF cntsm[ 2] GT 4 THEN oplot, FINDGEN(r_t_mag[ 2]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 2]), paramsmagking[2,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 3] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 3] GT 4 THEN plot, rad_fit[indx13m_gt0], f[3,indx13m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[3], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 3] GT 4 THEN oploterror, rad_fit[indx13m_gt0], f[3,indx13m_gt0], f_err[3,indx13m_gt0], psym=2
IF cntsm[ 3] GT 4 THEN oplot, FINDGEN(r_t_mag[ 3]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 3]), paramsmagking[3,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 4] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 4] GT 4 THEN plot, rad_fit[indx14m_gt0], f[4,indx14m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[4], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 4] GT 4 THEN oploterror, rad_fit[indx14m_gt0], f[4,indx14m_gt0], f_err[4,indx14m_gt0], psym=2
IF cntsm[ 4] GT 4 THEN oplot, FINDGEN(r_t_mag[ 4]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 4]), paramsmagking[4,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 5] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 5] GT 4 THEN plot, rad_fit[indx15m_gt0], f[5,indx15m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[5], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 5] GT 4 THEN oploterror, rad_fit[indx15m_gt0], f[5,indx15m_gt0], f_err[5,indx15m_gt0], psym=2
IF cntsm[ 5] GT 4 THEN oplot, FINDGEN(r_t_mag[ 5]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 5]), paramsmagking[5,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 6] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 6] GT 4 THEN plot, rad_fit[indx16m_gt0], f[6,indx16m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[6], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 6] GT 4 THEN oploterror, rad_fit[indx16m_gt0], f[6,indx16m_gt0], f_err[6,indx16m_gt0], psym=2
IF cntsm[ 6] GT 4 THEN oplot, FINDGEN(r_t_mag[ 6]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 6]), paramsmagking[6,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 7] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 7] GT 4 THEN plot, rad_fit[indx17m_gt0], f[7,indx17m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[7], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 7] GT 4 THEN oploterror, rad_fit[indx17m_gt0], f[7,indx17m_gt0], f_err[7,indx17m_gt0], psym=2
IF cntsm[ 7] GT 4 THEN oplot, FINDGEN(r_t_mag[ 7]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 7]), paramsmagking[7,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 8] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 8] GT 4 THEN plot, rad_fit[indx18m_gt0], f[8,indx18m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[8], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 8] GT 4 THEN oploterror, rad_fit[indx18m_gt0], f[8,indx18m_gt0], f_err[8,indx18m_gt0], psym=2
IF cntsm[ 8] GT 4 THEN oplot, FINDGEN(r_t_mag[ 8]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 8]), paramsmagking[8,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 9] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 9] GT 4 THEN plot, rad_fit[indx19m_gt0], f[9,indx19m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[9], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 9] GT 4 THEN oploterror, rad_fit[indx19m_gt0], f[9,indx19m_gt0], f_err[9,indx19m_gt0], psym=2
IF cntsm[ 9] GT 4 THEN oplot, FINDGEN(r_t_mag[ 9]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 9]), paramsmagking[9,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[10] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[10] GT 4 THEN plot, rad_fit[indx20m_gt0], f[10,indx20m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[10], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[10] GT 4 THEN oploterror, rad_fit[indx20m_gt0], f[10,indx20m_gt0], f_err[10,indx20m_gt0], psym=2
IF cntsm[10] GT 4 THEN oplot, FINDGEN(r_t_mag[10]), MPEVALEXPR(king, FINDGEN(r_t_mag[10]), paramsmagking[10,*]) , color=150, thick=3      ; Plot model                                
magindx= magindx+1 
IF cntsm[11] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[11] GT 4 THEN plot, rad_fit[indx21m_gt0], f[11,indx21m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[11], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[11] GT 4 THEN oploterror, rad_fit[indx21m_gt0], f[11,indx21m_gt0], f_err[11,indx21m_gt0], psym=2
IF cntsm[11] GT 4 THEN oplot, FINDGEN(r_t_mag[11]), MPEVALEXPR(king, FINDGEN(r_t_mag[11]), paramsmagking[11,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[12] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[12] GT 4 THEN plot, rad_fit[indx22m_gt0], f[12,indx22m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[12], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[12] GT 4 THEN oploterror, rad_fit[indx22m_gt0], f[12,indx22m_gt0], f_err[12,indx22m_gt0], psym=2
IF cntsm[12] GT 4 THEN oplot, FINDGEN(r_t_mag[12]), MPEVALEXPR(king, FINDGEN(r_t_mag[12]), paramsmagking[12,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[13] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[13] GT 4 THEN plot, rad_fit[indx23m_gt0], f[13,indx23m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[13], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)" 
IF cntsm[13] GT 4 THEN oploterror, rad_fit[indx23m_gt0], f[13,indx23m_gt0], f_err[13,indx23m_gt0], psym=2
IF cntsm[13] GT 4 THEN oplot, FINDGEN(r_t_mag[13]), MPEVALEXPR(king, FINDGEN(r_t_mag[13]), paramsmagking[13,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[14] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[14] GT 4 THEN plot, rad_fit[indx24m_gt0], f[14,indx24m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[14], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
IF cntsm[14] GT 4 THEN oploterror, rad_fit[indx24m_gt0], f[14,indx24m_gt0], f_err[14,indx24m_gt0], psym=2
IF cntsm[14] GT 4 THEN oplot, FINDGEN(r_t_mag[14]), MPEVALEXPR(king, FINDGEN(r_t_mag[14]), paramsmagking[14,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[15] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[15] GT 4 THEN plot, rad_fit[indx25m_gt0], f[15,indx25m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[15], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
IF cntsm[15] GT 4 THEN oploterror, rad_fit[indx25m_gt0], f[15,indx25m_gt0], f_err[15,indx25m_gt0], psym=2
IF cntsm[15] GT 4 THEN oplot, FINDGEN(r_t_mag[15]), MPEVALEXPR(king, FINDGEN(r_t_mag[15]), paramsmagking[15,*]) , color=150, thick=3      ; Plot model
multiplot, /reset
multiplot,[1,1],/init



 ;;; Saving Params  King
 openw, lun, '/home/grigor/Desktop/'+ cluster_name +'_paramsKing_step_r' + STRING(step_r, format='(i1)') + '.dat', /get_lun, width=200
 ;;; All stars
  printf,lun, [cluster_name, 'mag'+STRING(FIX(mags[minmagindx]), format='(i2)'), ' -- ', 'mag'+STRING(FIX(mags[MaxMagIndx]), format='(i2)'), SYSTIME(), " NITER=", STRING(niter_all,format='(i4)') ]
  printf,lun, [TRANSPOSE([' f_0_allk=', ' bkg_fitted_allk=', ' r_core_allk=', ' r_t_allk=']) , $
  TRANSPOSE(STRING([f_0_allk, f_bg_allk, r_c_allk, r_t_allk], format='(f11.3)')), $
  TRANSPOSE([ ' \pm ',  ' \pm ', ' \pm ',  ' \pm ']) , $
  TRANSPOSE(STRING([f_0_allk_err, f_bg_allk_err, r_c_allk_err, r_t_allk_err ], format='(f11.3, " & ")'))]
 ;;; Bright stars
  printf,lun, [cluster_name, 'mag'+STRING(FIX(mags[minmagindx]), format='(i2)'), ' -- ', 'mag'+STRING(FIX(MAX(mags[[WHERE(mags LT 20)]])), format='(i2)'), SYSTIME(), " NITER=", STRING(niter_brk,format='(i4)') ]
  printf,lun, [TRANSPOSE([' f_0_brk =', ' bkg_fitted_brk =', ' r_core_brk =', ' r_t_brk =']) , $
  TRANSPOSE(STRING([f_0_brk, f_bg_brk, r_c_brk, r_t_brk], format='(f11.3)')), $
  TRANSPOSE([ ' \pm ',  ' \pm ', ' \pm ',  ' \pm ']) , $
  TRANSPOSE(STRING([f_0_brk_err, f_bg_brk_err, r_c_brk_err, r_t_brk_err ], format='(f11.3, " & ")'))]
 ;;; Faint stars
  printf,lun, [cluster_name, 'mag'+STRING(FIX(MIN(mags[WHERE(mags GE 20)])), format='(i2)'), ' -- ', 'mag'+STRING(FIX(mags[maxmagindx]), format='(i2)'), SYSTIME(), " NITER=", STRING(niter_fak,format='(i4)') ]
  printf,lun, [TRANSPOSE([' f_0_fak =', ' bkg_fitted_fak =', ' r_core_fak =', ' r_t_fak =']) , $
  TRANSPOSE(STRING([f_0_fak, f_bg_fak, r_c_fak, r_t_fak], format='(f11.3)')), $
  TRANSPOSE([ ' \pm ',  ' \pm ', ' \pm ',  ' \pm ']) , $
  TRANSPOSE(STRING([f_0_fak_err, f_bg_fak_err, r_c_fak_err, r_t_fak_err ], format='(f11.3, " & ")'))]
 ;;; each magnitude
 FOR m=minmagindx-1, maxmagindx DO BEGIN   $&$
  printf,lun, [cluster_name, 'mag'+STRING(FIX(mags[m]), format='(i2)'), ' -- ', 'mag'+STRING(FIX(mags[m+1]), format='(i2)'), SYSTIME(), " NITER=", STRING(niter_magsk[m],format='(i4)') ] &$
  printf,lun, [TRANSPOSE([' f_0_mag =', ' bkg_fitted_mag =', ' r_core_mag =', ' r_t_mag =']) , $&$
  TRANSPOSE(STRING([f_0_mag[m], f_bg_mag[m], r_c_mag[m], r_t_mag[m]], format='(f11.3)')), $
  TRANSPOSE([ ' \pm ',  ' \pm ', ' \pm ',  ' \pm ']) , $&$
  TRANSPOSE(STRING([f_0_mag_err[m], f_bg_mag_err[m], r_c_mag_err[m], r_t_mag_err[m] ], format='(f11.3, " & ")'))] &$
  ENDFOR
  free_lun, lun
 
 
 
 
 
 
 ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 ;;; Creating the PS output
 
 !p.font=0 	;Selecting better type font 
 
 
 set_plot,'ps'  
 device, SET_FONT='Times', /TT_Font
 device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
 filename='/home/grigor/Desktop/'+ cluster_name +'_rdp_all_king.eps'
 ploterror, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], psym=2, $
 	 yrange=[min(f_all), max(f_all)], YTickFormat='exponent_labels', XTickFormat="(g0)", xtit='radial distance [arcsec]', ytit='density [stars/arcmin!u2!n]', tit='RDP for the cluster '+cluster_name,  /XLOG, /YLOG 
 oplot, FINDGEN(r_t_allk), MPEVALEXPR(king, FINDGEN(r_t_allk), paramsall) , thick=2, color=FSC_COLOR("ForestGreen")       	; Plot model
ARROW, r_c_allk, MIN(f_all),   r_c_allk, MEAN(f_all), /DATA, color=FSC_COLOR("ForestGreen")
xyouts, 60, MAX(f_all)/1.0,   "King Rc", color=FSC_COLOR("ForestGreen")
 device, /close_file
 set_plot, 'X'
 
 set_plot,'ps'  
 device, SET_FONT='Times', /TT_Font
 device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=18,$
 filename='/home/grigor/Desktop/'+ cluster_name +'_rdp_brfa_king.eps'
 multiplot, [1,2], ygap=0.02
 ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=4, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r],  $ 
  		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit='Bright stars V < 20', ytit=TeXtoIDL("density [stars/arcmin^2]")
 oplot, FINDGEN(r_t_brk), MPEVALEXPR(king , FINDGEN(r_t_brk), paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
 multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=6, xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], $ 
 		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit=TeXtoIDL("Faint stars 20 \leq V \leq 25"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
 oplot, FINDGEN(r_t_fak), MPEVALEXPR(king , FINDGEN(r_t_fak), paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
 multiplot, /reset
 multiplot,[1,1],/init
 device, /close_file
 set_plot, 'X'
 
 SET_PLOT, 'PS'
 device, SET_FONT='Times', /TT_Font
 device, /ENCAPSULATED, /Times, /PORTRAIT, xsize=8.7,ysize=8.7,$
 filename='/home/grigor/Desktop/'+ cluster_name +'_Rc_king.eps'
 ploterror, (0.5*step_mag+mags[3:*]), r_c_mag[3:*], REPLICATE(0.5,n_elements(mags[3:*])), r_c_mag_err[3:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The core radii for ")+cluster_name
 oploterror, [17.5], [r_c_brk], [2.5],[r_c_brk_err], psym=5, thick=1, ERRCOLOR=FSC_COLOR("blue")
 oploterror, [22.5], [r_c_fak], [2.5],[r_c_fak_err], psym=4, thick=1, ERRCOLOR=FSC_COLOR("red")
 oploterror, [20.0], [r_c_allk],[5.0],[r_c_allk_err], psym=6, thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
 DEVICE, /CLOSE_FILE
 SET_PLOT, 'X'
 
 SET_PLOT, 'PS'
 device, SET_FONT='Times', /TT_Font
 device, /ENCAPSULATED, /Times, /PORTRAIT, xsize=8.7,ysize=8.7,$
 filename='/home/grigor/Desktop/'+ cluster_name +'_Rt_king.eps'
 ploterror, (0.5*step_mag+mags[3:*]), r_t_mag[3:*], REPLICATE(0.5,n_elements(mags[3:*])), r_t_mag_err[3:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 150], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The tidal radii for ")+cluster_name
 oploterror, [17.5], [r_t_brk], [2.5],[r_t_brk_err], psym=5, thick=1, ERRCOLOR=FSC_COLOR("blue")
 oploterror, [22.5], [r_t_fak], [2.5],[r_t_fak_err], psym=4, thick=1, ERRCOLOR=FSC_COLOR("red")
 oploterror, [20.0], [r_t_allk],[5.0],[r_t_allk_err], psym=6, thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
 DEVICE, /CLOSE_FILE
 SET_PLOT, 'X'
 
 
 set_plot,'ps'  
 device, SET_FONT='Times', /TT_Font
 device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
 filename='/home/grigor/Desktop/'+ cluster_name +'_rdp_mags_king.eps'
 multiplot, [3,4], ygap=0.02, xgap=0.04
 magindx=  1          
 IF cntsm[ 1] GT 4 THEN plot, rad_fit[indx11m_gt0], f[1,indx11m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[1], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 1] GT 4 THEN oploterror, rad_fit[indx11m_gt0], f[1,indx11m_gt0], f_err[1,indx11m_gt0], psym=2
 IF cntsm[ 1] GT 4 THEN oplot, FINDGEN(r_t_mag[ 1]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 1]), paramsmagking[1,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 2] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 2] GT 4 THEN plot, rad_fit[indx12m_gt0], f[2,indx12m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[2], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 2] GT 4 THEN oploterror, rad_fit[indx12m_gt0], f[2,indx12m_gt0], f_err[2,indx12m_gt0], psym=2
 IF cntsm[ 2] GT 4 THEN oplot, FINDGEN(r_t_mag[ 2]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 2]), paramsmagking[2,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 3] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 3] GT 4 THEN plot, rad_fit[indx13m_gt0], f[3,indx13m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[3], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 3] GT 4 THEN oploterror, rad_fit[indx13m_gt0], f[3,indx13m_gt0], f_err[3,indx13m_gt0], psym=2
 IF cntsm[ 3] GT 4 THEN oplot, FINDGEN(r_t_mag[ 3]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 3]), paramsmagking[3,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 4] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 4] GT 4 THEN plot, rad_fit[indx14m_gt0], f[4,indx14m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[4], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 4] GT 4 THEN oploterror, rad_fit[indx14m_gt0], f[4,indx14m_gt0], f_err[4,indx14m_gt0], psym=2
 IF cntsm[ 4] GT 4 THEN oplot, FINDGEN(r_t_mag[ 4]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 4]), paramsmagking[4,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 5] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 5] GT 4 THEN plot, rad_fit[indx15m_gt0], f[5,indx15m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[5], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 5] GT 4 THEN oploterror, rad_fit[indx15m_gt0], f[5,indx15m_gt0], f_err[5,indx15m_gt0], psym=2
 IF cntsm[ 5] GT 4 THEN oplot, FINDGEN(r_t_mag[ 5]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 5]), paramsmagking[5,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 6] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 6] GT 4 THEN plot, rad_fit[indx16m_gt0], f[6,indx16m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[6], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 6] GT 4 THEN oploterror, rad_fit[indx16m_gt0], f[6,indx16m_gt0], f_err[6,indx16m_gt0], psym=2
 IF cntsm[ 6] GT 4 THEN oplot, FINDGEN(r_t_mag[ 6]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 6]), paramsmagking[6,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 7] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 7] GT 4 THEN plot, rad_fit[indx17m_gt0], f[7,indx17m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[7], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 7] GT 4 THEN oploterror, rad_fit[indx17m_gt0], f[7,indx17m_gt0], f_err[7,indx17m_gt0], psym=2
 IF cntsm[ 7] GT 4 THEN oplot, FINDGEN(r_t_mag[ 7]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 7]), paramsmagking[7,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 8] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 8] GT 4 THEN plot, rad_fit[indx18m_gt0], f[8,indx18m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[8], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 8] GT 4 THEN oploterror, rad_fit[indx18m_gt0], f[8,indx18m_gt0], f_err[8,indx18m_gt0], psym=2
 IF cntsm[ 8] GT 4 THEN oplot, FINDGEN(r_t_mag[ 8]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 8]), paramsmagking[8,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[ 9] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[ 9] GT 4 THEN plot, rad_fit[indx19m_gt0], f[9,indx19m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[9], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[ 9] GT 4 THEN oploterror, rad_fit[indx19m_gt0], f[9,indx19m_gt0], f_err[9,indx19m_gt0], psym=2
 IF cntsm[ 9] GT 4 THEN oplot, FINDGEN(r_t_mag[ 9]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 9]), paramsmagking[9,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[10] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[10] GT 4 THEN plot, rad_fit[indx20m_gt0], f[10,indx20m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[10], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[10] GT 4 THEN oploterror, rad_fit[indx20m_gt0], f[10,indx20m_gt0], f_err[10,indx20m_gt0], psym=2
 IF cntsm[10] GT 4 THEN oplot, FINDGEN(r_t_mag[10]), MPEVALEXPR(king, FINDGEN(r_t_mag[10]), paramsmagking[10,*]) , color=150, thick=3      ; Plot model                                
 magindx= magindx+1 
 IF cntsm[11] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[11] GT 4 THEN plot, rad_fit[indx21m_gt0], f[11,indx21m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[11], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[11] GT 4 THEN oploterror, rad_fit[indx21m_gt0], f[11,indx21m_gt0], f_err[11,indx21m_gt0], psym=2
 IF cntsm[11] GT 4 THEN oplot, FINDGEN(r_t_mag[11]), MPEVALEXPR(king, FINDGEN(r_t_mag[11]), paramsmagking[11,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[12] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[12] GT 4 THEN plot, rad_fit[indx22m_gt0], f[12,indx22m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[12], format="(f4.0)"), YTickFormat='(e7.0)'
 IF cntsm[12] GT 4 THEN oploterror, rad_fit[indx22m_gt0], f[12,indx22m_gt0], f_err[12,indx22m_gt0], psym=2
 IF cntsm[12] GT 4 THEN oplot, FINDGEN(r_t_mag[12]), MPEVALEXPR(king, FINDGEN(r_t_mag[12]), paramsmagking[12,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[13] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[13] GT 4 THEN plot, rad_fit[indx23m_gt0], f[13,indx23m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[13], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)" 
 IF cntsm[13] GT 4 THEN oploterror, rad_fit[indx23m_gt0], f[13,indx23m_gt0], f_err[13,indx23m_gt0], psym=2
 IF cntsm[13] GT 4 THEN oplot, FINDGEN(r_t_mag[13]), MPEVALEXPR(king, FINDGEN(r_t_mag[13]), paramsmagking[13,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[14] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[14] GT 4 THEN plot, rad_fit[indx24m_gt0], f[14,indx24m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[14], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
 IF cntsm[14] GT 4 THEN oploterror, rad_fit[indx24m_gt0], f[14,indx24m_gt0], f_err[14,indx24m_gt0], psym=2
 IF cntsm[14] GT 4 THEN oplot, FINDGEN(r_t_mag[14]), MPEVALEXPR(king, FINDGEN(r_t_mag[14]), paramsmagking[14,*]) , color=150, thick=3      ; Plot model
 magindx= magindx+1 
 IF cntsm[15] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
 IF cntsm[15] GT 4 THEN plot, rad_fit[indx25m_gt0], f[15,indx25m_gt0], psym=2, /XLOG, /YLOG, title=STRING(mags[15], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
 IF cntsm[15] GT 4 THEN oploterror, rad_fit[indx25m_gt0], f[15,indx25m_gt0], f_err[15,indx25m_gt0], psym=2
 IF cntsm[15] GT 4 THEN oplot, FINDGEN(r_t_mag[15]), MPEVALEXPR(king, FINDGEN(r_t_mag[15]), paramsmagking[15,*]) , color=150, thick=3      ; Plot model
 multiplot, /reset
 multiplot,[1,1],/init
 device, /close_file
 set_plot, 'X'
 
 
  set_plot,'ps'  
  device, SET_FONT='Times', /TT_Font
  device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
  filename='/home/grigor/Desktop/'+ cluster_name +'_n_st_mags.eps'
  multiplot, [4,5], ygap=0.02
  ploterror, rad_fit[indx_to_fit_br], n_st_br, n_st_br_err, psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st_br)],  title='V < 20 mag' , ytit='number of stars', xtit='r [arcsec]'
  multiplot & IF cntsm[ 2] GT 4 THEN ploterror, rad_fit, n_st[2,*], n_st_err[2,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[2], format="(f4.1)")
  multiplot & IF cntsm[ 3] GT 4 THEN ploterror, rad_fit, n_st[3,*], n_st_err[3,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[3], format="(f4.1)")
  multiplot & IF cntsm[ 4] GT 4 THEN ploterror, rad_fit, n_st[4,*], n_st_err[4,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[4], format="(f4.1)")
  multiplot & IF cntsm[ 5] GT 4 THEN ploterror, rad_fit, n_st[5,*], n_st_err[5,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[5], format="(f4.1)"), ytit='number of stars' 
  multiplot & IF cntsm[ 6] GT 4 THEN ploterror, rad_fit, n_st[6,*], n_st_err[6,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[6], format="(f4.1)") 
  multiplot & IF cntsm[ 7] GT 4 THEN ploterror, rad_fit, n_st[7,*], n_st_err[7,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[7], format="(f4.1)") 
  multiplot & IF cntsm[ 8] GT 4 THEN ploterror, rad_fit, n_st[8,*], n_st_err[8,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[8], format="(f4.1)")
  multiplot & IF cntsm[ 9] GT 4 THEN ploterror, rad_fit, n_st[9,*], n_st_err[9,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[9], format="(f4.1)"), ytit='number of stars'  
  multiplot & IF cntsm[10] GT 4 THEN ploterror, rad_fit, n_st[10,*], n_st_err[10,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[10], format="(f4.1)")
  multiplot & IF cntsm[11] GT 4 THEN ploterror, rad_fit, n_st[11,*], n_st_err[11,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[11], format="(f4.1)") 
  multiplot & IF cntsm[12] GT 4 THEN ploterror, rad_fit, n_st[12,*], n_st_err[12,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[12], format="(f4.1)")
  multiplot & IF cntsm[13] GT 4 THEN ploterror, rad_fit, n_st[13,*], n_st_err[13,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[13], format="(f4.1)"), ytit='number of stars'  
  multiplot & IF cntsm[14] GT 4 THEN ploterror, rad_fit, n_st[14,*], n_st_err[14,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[14], format="(f4.1)") 
  multiplot & IF cntsm[15] GT 4 THEN ploterror, rad_fit, n_st[15,*], n_st_err[15,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[15], format="(f4.1)")
  multiplot & IF cntsm[16] GT 4 THEN ploterror, rad_fit, n_st[16,*], n_st_err[16,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[16], format="(f4.1)")
  multiplot & IF cntsm[17] GT 4 THEN ploterror, rad_fit, n_st[17,*], n_st_err[17,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[17], format="(f4.1)"), xtit='r [arcsec]', ytit='number of stars'
  multiplot & IF cntsm[18] GT 4 THEN ploterror, rad_fit, n_st[18,*], n_st_err[18,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[18], format="(f4.1)"), xtit='r [arcsec]'
  multiplot & IF cntsm[19] GT 4 THEN ploterror, rad_fit, n_st[19,*], n_st_err[19,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)],  title=STRING(mags[19], format="(f4.1)"), xtit='r [arcsec]'
  multiplot &  ploterror, rad_fit[indx_to_fit_fa], n_st_fa, n_st_fa_err,  psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st_fa)],  title=TeXtoIDL("V \geq 20"), xtit='r [arcsec]', ytit='number of stars' 
  multiplot, /reset
  multiplot,[1,1],/init
  device, /close_file
  set_plot, 'X'


!p.font=-1 	;Selecting normal font type
;;; end of PS output



;;; stop    ;prevent creation of PS files
;;;
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_completeness.eps'
;;; plot, mags,compl_mags, thick=3, xtit="magnitude", ytit="completeness factor", tit="Completeness function"
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_completeness_mags.eps'
;;; multiplot, [(n_elements(rad_fit)-2)/4,n_elements(mags)/4], xgap=0.02, ygap=0.03
;;; plot, mags, complete_arr[*,0], title=STRING(rad_fit[0], format='(f4.1, " asec")'), thick=2 , xtit='magnitude', ytit='completeness', CHARSIZE=0.7
;;; ;oplot, mags, completeness_arr[*,0], color=FSC_COLOR("red") 
;;; oplot, mags, (complete_arr[*,0] * completeness_correction[*,0]), color=FSC_COLOR("blue")
;;; oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")
;;; FOR j=1, (n_elements(rad_fit)-2) DO BEGIN  &$
;;; 	multiplot &$
;;; 	plot, mags, complete_arr[*,j], title=STRING(rad_fit[j],format='(f4.1, " asec")'), thick=2, CHARSIZE=0.7 &$
;;; ;	oplot, mags, completeness_arr[*,j], color=FSC_COLOR("red") &$
;;; 	oplot, mags, (complete_arr[*,j] * completeness_correction[*,j]), color=FSC_COLOR("blue") &$
;;; 	oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")  &$
;;; ENDFOR
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_LF.eps'
;;; plothist, mv, bin=lfbin, thick=3, /boxplot, xtit='magnitude', ytit='Number of stars', title='LF for '+cluster_name
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_fn.eps'
;;; ploterror, rad, f_n_all, f_n_all_err, psym=2, xtit='radius [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]"), tit=cluster_name+' NDP'
;;; oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(elson, rad_fit[indx_to_fit_all], params_els) , color=FSC_COLOR("red"), thick=2 			; Plot model
;;; oplot, rad_fit, REPLICATE(bkg_fitted_all, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_cmd_inout.eps'
;;; !p.multi=[0,2,1,0,0]
;;; multiplot, xgap=0.02
;;; plot, col[WHERE(d_as LE rad[0])], mv[WHERE(d_as LE rad[0])], psym=3, xran=[-1,2], yran=[30,15], xtit='V - I', ytit='V magnitude', tit='CMD between '+STRING(rad[0]-step_r,format='(i1)')+'-'+STRING(rad[0],format='(i1)')+' arcsec'
;;; multiplot & plot, col[WHERE(d_as LE max_rad_fit AND d_as GT (max_rad_fit-step_r))], mv[WHERE(d_as LE max_r AND d_as GT (max_r-step_r))], psym=3, xran=[-1,2], yran=[30,15], xtit='V - I', $ 
;;; 				tit='CMD between '+STRING(rad[n_elements(rad_fit)-2]-step_r,format='(i3)')+'-'+STRING(rad[n_elements(rad_fit)-1],format='(i3)')+' arcsec'
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; 
;;; 
;;; SET_PLOT, 'PS'
;;; device, SET_FONT='Times', /TT_Font
;;; device, /ENCAPSULATED, /Times, /Courier, /PORTRAIT, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_Rc.eps'
;;; ploterror, [(0.5*step_mag+mags[1:*]),17.5,22.5,20.0], [r_core_mag[1:*],r_core_br,r_core_fa,r_core_all], [REPLICATE(step_mag/2,n_elements(mags[1:*])),2.5,2.5,5.0], [boot_Rcmag_err[1:*],boot_Rcbr_err,boot_Rcfa_err,boot_Rc_err], /NODATA , $
;;;     xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit='Core radius [arcsec]' , tit= cluster_name
;;; oploterror, (0.5*step_mag+mags[1:*]), r_core_mag[1:*], REPLICATE(step_mag/2,n_elements(mags[1:*])), boot_Rcmag_err[1:*], psym=6
;;; oploterror, [17.5], [r_core_br],[2.5],[boot_Rcbr_err], psym=5, thick=1, ERRCOLOR=FSC_COLOR("blue")
;;; oploterror, [22.5], [r_core_fa],[2.5],[boot_Rcfa_err], psym=4, thick=1, ERRCOLOR=FSC_COLOR("red")
;;; oploterror, [20.0], [r_core_all],[5.0],[boot_Rc_err], psym=6, thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
;;; DEVICE, /CLOSE_FILE
;;; SET_PLOT, 'X'
;;; 
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_gamma_mags.eps'
;;; ploterror, mags[0:*], paramsmagels[0:*,2], REPLICATE(1.0,n_elements(mags[0:*])), gamma_mag_err[0:*], psym=6, xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 20], xtit='magnitude', ytit="gamma", tit=TeXtoIDL("The slope \gamma of the EFF fit")
;;; oploterror, [17,19,22], [paramsbr[2], params_els[2], paramsfa[2]],[3,5,2],[0,0,0], psym=2
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_eff_a_mags.eps'
;;; ploterror, (0.5*step_mag+mags[1:*]), eff_a_mag[1:*], REPLICATE(1.0,n_elements(mags[1:*])), eff_a_mag_err[1:*], psym=2, $ 
;;;  	xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit='EFF a [arcsec]', yran=[0,MAX(eff_a_mag)] , tit="Elson a(mag)"
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_xy_mags.eps'
;;; multiplot, [n_elements(rad)/4,4], xgap=0.02, ygap=0.02
;;; FOR j=1, (n_elements(mags)-2) DO BEGIN  &$
;;; 	multiplot &$
;;; 	index= WHERE(mv GT mags[j] AND mv LE mags[j+1], cntindex) &$
;;; 	IF cntindex GT 0 THEN plot, x(index), y(index), psym=3, xran=[-1600,1600], yran=[-1600,1600], /ISOTROPIC, tit=STRING(FIX(mags[j]))+" mag" &$
;;; ENDFOR
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; set_plot,'ps'  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,bits_per_pixel=8, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
;;; filename='/home/grigor/Desktop/'+ cluster_name +'_cmds.eps'
;;; multiplot, [n_elements(mags)/4,4], xgap=0.02, ygap=0.02
;;; plot, col(WHERE(d_as GT rad[0] AND d_as LE rad[1])), mv(WHERE(d_as GT rad[0] AND d_as LE rad[1])), psym=3, xran=[-1,2], yran=[30,15], tit=STRING(FIX(rad[0]))+" arcsec", ytit="V [mag]"
;;; FOR j=1, (n_elements(mags)-2) DO BEGIN  &$
;;; 	multiplot &$
;;; 	index= WHERE(d_as GT rad[j] AND d_as LE rad[j+1], cntindex) &$
;;; 	IF cntindex GT 0 THEN plot, col(index), mv(index), psym=3, xran=[-1,2], yran=[30,15], tit=STRING(FIX(rad[j]))+" arcsec" &$
;;; ENDFOR
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'
;;; 
;;; 
;;; !p.font=-1 	;Selecting normal font type
;;; ;;; end of PS output

;;; Saving IDL variables, to be able to RESTORE them
session_time= SYSTIME()
SAVE, /VARIABLES, /COMPRESS, filename='/home/grigor/Desktop/'+cluster_name+'_King_session.idlsav'

stop , cluster_name, ' Radial step =', FIX(step_r), ' [arcsec]'
end
