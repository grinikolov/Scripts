pro king_plot_restore  

;; pro rdp_comp_profile_fit_bkg_stopmag_king    <---- Plots the restore from that program

SET_PLOT, 'X' & !p.font=-1 & multiplot, [1,1]    ; & !x.margin=[12,3]  	;Selecting normal font type & larger X margin for labels
windown=0

  ;;; NGC 1711
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 1711_King_session.idlsav"

;;;  ;;; NGC 1898  ;Dropped out due to Refferee's comments, second one
;;; restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/current/NGC 1898_King_session.idlsav"

  ;;; NGC 1984
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 1984_King_session.idlsav"

  ;;; NGC 2004
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2004_King_session.idlsav"

  ;;; NGC 2011
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2011_King_session.idlsav"

  ;;; NGC 2031
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2031_King_session.idlsav"

  ;;; NGC 2121
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2121_King_session.idlsav"

  ;;; NGC 2157
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2157_King_session.idlsav"

  ;;; NGC 2214
 restore, "/home/grinikolov/Desktop/clust_profiles/King_fits/final/NGC 2214_King_session.idlsav"




; windown=windown+1 &    window, windown
; ;plot, (lfbin*indgen(20/lfbin) +10.) , LF, thick=3, psym=10, xtit='magnitude',ytit=lfbin, title='LF for '+cluster_name
; plothist, mv, bin=lfbin, thick=3, /boxplot, xtit='magnitude', ytit='Number of stars', title='LF for '+cluster_name
; 
; ; Distance Scale in LMC
; LMC_pc=10^ (0.2* (18.5 +5 )) 		; The distance in [parsecs] to LMC, (applying distance modulus=18.5)
; parsec= 206265./LMC_pc 			; The scale at the distance of the LMC  in [arcsec / parsec] = 4.1155  ==> 1 arcsec =approx. 0.25 parsecs
; 
; 
; windown=windown+1 &    window, windown  &  plot, mags,compl_mags, xticklen=1,yticklen=1, thick=5, xtit="magnitude", ytit="completeness factor", tit="Completeness function"
; 
; 
; windown=windown+1 &    window, windown, xsize=1200, ysize=800
; multiplot, [(n_elements(rad_fit)-2)/4,n_elements(mags)/4], xgap=0.02, ygap=0.02
; plot, mags, complete_arr[*,0], title=STRING(rad_fit[0], format='(f4.1, " arcsec")'), thick=2 , xtit='magnitude', ytit='completeness'
; ;oplot, mags, completeness_arr[*,0], color=FSC_COLOR("red") 
; oplot, mags, (complete_arr[*,0] * completeness_correction[*,0]), color=FSC_COLOR("blue")
; oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")
; FOR j=1, (n_elements(rad_fit)-2) DO BEGIN  &$
; 	multiplot &$
; 	plot, mags, complete_arr[*,j], title=STRING(rad_fit[j],format='(f4.1, " arcsec")'), thick=2 &$
; ;	oplot, mags, completeness_arr[*,j], color=FSC_COLOR("red") &$
; 	oplot, mags, (complete_arr[*,j] * completeness_correction[*,j]), color=FSC_COLOR("blue") &$
; 	oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")  &$
; ENDFOR
; multiplot, /reset
; multiplot,[1,1],/init
; 
; 
; 
; windown=windown+1 &    window, windown, xsize=500, ysize=500, tit='Fitted All stars king'
; ploterror, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], psym=2, $
; 	 yrange=[min(f_all), max(f_all)], YTickFormat='exponent_labels', XTickFormat="(g0)", xtit='radial distance [arcsec]', ytit='density [stars/arcmin!u2!n]', tit='RDP for the cluster '+cluster_name,  /XLOG, /YLOG 
; oplot, FINDGEN(r_t_allk), MPEVALEXPR(king, FINDGEN(r_t_allk), paramsall) , thick=2, color=FSC_COLOR("ForestGreen")       	; Plot model
; ARROW, r_c_allk, MIN(f_all),   r_c_allk, MEAN(f_all), /DATA, color=FSC_COLOR("ForestGreen")
; xyouts, 60, MAX(f_all)/1.0,   "King Rc", color=FSC_COLOR("ForestGreen")
; 
; 
; ; BACKGROUND for all stars
; windown=windown+1 &    window, windown
; ploterror, rad_fit, f_n_all, f_n_all_err, psym=2, xtit='radius [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]"), tit=cluster_name+' NDP'
; ;oplot, rad, replicate(min(f_n_all),n_elements(rad)), thick=1, color=150
; oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(king, rad_fit[indx_to_fit_all], paramsall) , psym=-1, thick=2, color=FSC_COLOR("blue")                	; Plot model
; oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(elson, rad_fit[indx_to_fit_all], params_els) , color=FSC_COLOR("red"), thick=2 			; Plot model
; oplot, rad_fit, REPLICATE(f_bg_allk, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
; xyouts, max_rad_fit, max(f_all)/1.0, "King model", color=FSC_COLOR("blue")
; xyouts, max_rad_fit, max(f_all)/1.1, "EFF model", color=FSC_COLOR("red")
; ARROW, r_c_allk, MIN(f_all),   r_c_allk, MEAN(f_all), /DATA, color=FSC_COLOR("blue")
; ARROW, r_core_all, MIN(f_all), r_core_all, MEAN(f_all), /DATA, color=FSC_COLOR("red")
; ARROW, eff_a_all, MIN(f_all),  eff_a_all, MEAN(f_all), /DATA, color=FSC_COLOR("ForestGreen")
; xyouts, 60, MAX(f_all)/1.0,   "King Rc", color=FSC_COLOR("blue")
; xyouts, 60, MAX(f_all)/1.1, "EFF Rc", color=FSC_COLOR("red")
; xyouts, 60, MAX(f_all)/1.2,  "EFF a", color=FSC_COLOR("ForestGreen")
; 
; 
; 
; 
; windown=windown+1 &    window, windown ,xsize=400, ysize=700, title='Bright and Faint stars'
; multiplot, [1,2], ygap=0.02
; ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=SYMCAT(4), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r],  $ 
;  		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit='Bright stars V < 20', ytit=TeXtoIDL("density [stars/arcmin^2]")
; oplot, FINDGEN(r_t_brk), MPEVALEXPR(king , FINDGEN(r_t_brk), paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
; multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=SYMCAT(15), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], $ 
; 		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit=TeXtoIDL("Faint stars 20 \leq V \leq 25"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
; oplot, FINDGEN(r_t_fak), MPEVALEXPR(king , FINDGEN(r_t_fak), paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
; multiplot, /reset
; multiplot,[1,1],/init
; 
; ; windown=windown+1 &    window, windown,xsize=400, ysize=700, title='_Bright and Faint stars'
; ; !p.multi=[0,1,2,0,0]
; ; multiplot, ygap=0.02
; ; ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=SYMCAT(4), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1 , $
; ;  		YTickFormat='exponent_labels' , tit='Bright stars V < 20 mag', ytit=TeXtoIDL("density [stars/arcmin^2]")
; ; oplot, rad_fit[indx_to_fit_br], MPEVALEXPR(king , rad_fit[indx_to_fit_br], paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
; ; oplot, rad_fit, REPLICATE(f_bg_brk, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
; ; multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=SYMCAT(15), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], xstyle=1, $ 
; ;  		YTickFormat='exponent_labels', XTickFormat="(g0)", tit=TeXtoIDL("Faint stars V \geq 20 mag"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
; ; oploterror, rad_fit(indx_to_fit_fabkg), f_fabkg(indx_to_fit_fabkg), f_fabkg_err(indx_to_fit_fabkg), psym=SYMCAT(17), color=FSC_COLOR("DeepPink")
; ; oplot,      rad_fit(indx_to_fit_fabkg), MPEVALEXPR(elsonbkg, rad_fit(indx_to_fit_fabkg), paramsfabkg) , color=FSC_COLOR("DeepPink"), thick=2 	; Plot model
; ; oplot, rad_fit[indx_to_fit_fa], MPEVALEXPR(king , rad_fit[indx_to_fit_fa], paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
; ; oplot, rad_fit, REPLICATE(f_bg_fak, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
; ; multiplot, /reset
; ; multiplot,[1,1],/init
; 
; print, '---------Core Radius: _all, _br, _fa   and errors below'
; print, [[r_c_allk, r_c_brk, r_c_fak],[r_c_allk_err, r_c_brk_err, r_c_fak_err]]
; print, '---------Tidal Radius: _all, _br, _fa   and errors below'
; print, [[r_t_allk, r_t_brk, r_t_fak],[r_t_allk_err, r_t_brk_err, r_t_fak_err]]
; 
; 
; ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; ;   Profile fitting for each magnitude separately
; 
; windown=windown+1 &    window, windown, xsize=400, ysize=400   ; Core radii
; ploterror, (0.5*step_mag+mags[1:*]), r_c_mag[1:*], REPLICATE(0.5,n_elements(mags[1:*])), r_c_mag_err[1:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The core radii for ")+cluster_name
; oploterror, [17.5], [r_c_brk], [2.5],[r_c_brk_err], psym=SYMCAT(17), thick=1, ERRCOLOR=FSC_COLOR("blue")
; oploterror, [22.5], [r_c_fak], [2.5],[r_c_fak_err], psym=SYMCAT(4), thick=1, ERRCOLOR=FSC_COLOR("red")
; oploterror, [20.0], [r_c_allk],[5.0],[r_c_allk_err], psym=SYMCAT(15), thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
; 
; windown=windown+1 &    window, windown, xsize=400, ysize=400   ; Tidal radii
; ploterror, (0.5*step_mag+mags[1:*]), r_t_mag[1:*], REPLICATE(0.5,n_elements(mags[1:*])), r_t_mag_err[1:*], psym=2, xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 150], xtit='magnitude', ytit="King Rc [arcsec]", tit=TeXtoIDL("The tidal radii for ")+cluster_name
; oploterror, [17.5], [r_t_brk], [2.5],[r_t_brk_err], psym=SYMCAT(17), thick=1, ERRCOLOR=FSC_COLOR("blue")
; oploterror, [22.5], [r_t_fak], [2.5],[r_t_fak_err], psym=SYMCAT(4), thick=1, ERRCOLOR=FSC_COLOR("red")
; oploterror, [20.0], [r_t_allk],[5.0],[r_t_allk_err], psym=SYMCAT(15), thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
; 
; windown=windown+1 &    window, windown, xsize=800, ysize=800        ;plotting RDPs 
; multiplot, [3,4], ygap=0.02, xgap=0.04
; magindx=  1          
; IF cntsm[ 1] GT 4 THEN plot, rad_fit[indx11m_gt0], f[1,indx11m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[1], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 1] GT 4 THEN oploterror, rad_fit[indx11m_gt0], f[1,indx11m_gt0], f_err[1,indx11m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 1] GT 4 THEN oplot, FINDGEN(r_t_mag[ 1]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 1]), paramsmagking[1,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 2] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 2] GT 4 THEN plot, rad_fit[indx12m_gt0], f[2,indx12m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[2], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 2] GT 4 THEN oploterror, rad_fit[indx12m_gt0], f[2,indx12m_gt0], f_err[2,indx12m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 2] GT 4 THEN oplot, FINDGEN(r_t_mag[ 2]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 2]), paramsmagking[2,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 3] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 3] GT 4 THEN plot, rad_fit[indx13m_gt0], f[3,indx13m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[3], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 3] GT 4 THEN oploterror, rad_fit[indx13m_gt0], f[3,indx13m_gt0], f_err[3,indx13m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 3] GT 4 THEN oplot, FINDGEN(r_t_mag[ 3]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 3]), paramsmagking[3,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 4] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 4] GT 4 THEN plot, rad_fit[indx14m_gt0], f[4,indx14m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[4], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 4] GT 4 THEN oploterror, rad_fit[indx14m_gt0], f[4,indx14m_gt0], f_err[4,indx14m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 4] GT 4 THEN oplot, FINDGEN(r_t_mag[ 4]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 4]), paramsmagking[4,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 5] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 5] GT 4 THEN plot, rad_fit[indx15m_gt0], f[5,indx15m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[5], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 5] GT 4 THEN oploterror, rad_fit[indx15m_gt0], f[5,indx15m_gt0], f_err[5,indx15m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 5] GT 4 THEN oplot, FINDGEN(r_t_mag[ 5]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 5]), paramsmagking[5,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 6] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 6] GT 4 THEN plot, rad_fit[indx16m_gt0], f[6,indx16m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[6], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 6] GT 4 THEN oploterror, rad_fit[indx16m_gt0], f[6,indx16m_gt0], f_err[6,indx16m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 6] GT 4 THEN oplot, FINDGEN(r_t_mag[ 6]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 6]), paramsmagking[6,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 7] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 7] GT 4 THEN plot, rad_fit[indx17m_gt0], f[7,indx17m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[7], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 7] GT 4 THEN oploterror, rad_fit[indx17m_gt0], f[7,indx17m_gt0], f_err[7,indx17m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 7] GT 4 THEN oplot, FINDGEN(r_t_mag[ 7]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 7]), paramsmagking[7,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 8] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 8] GT 4 THEN plot, rad_fit[indx18m_gt0], f[8,indx18m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[8], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 8] GT 4 THEN oploterror, rad_fit[indx18m_gt0], f[8,indx18m_gt0], f_err[8,indx18m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 8] GT 4 THEN oplot, FINDGEN(r_t_mag[ 8]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 8]), paramsmagking[8,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[ 9] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[ 9] GT 4 THEN plot, rad_fit[indx19m_gt0], f[9,indx19m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[9], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[ 9] GT 4 THEN oploterror, rad_fit[indx19m_gt0], f[9,indx19m_gt0], f_err[9,indx19m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[ 9] GT 4 THEN oplot, FINDGEN(r_t_mag[ 9]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 9]), paramsmagking[9,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[10] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[10] GT 4 THEN plot, rad_fit[indx20m_gt0], f[10,indx20m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[10], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[10] GT 4 THEN oploterror, rad_fit[indx20m_gt0], f[10,indx20m_gt0], f_err[10,indx20m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[10] GT 4 THEN oplot, FINDGEN(r_t_mag[10]), MPEVALEXPR(king, FINDGEN(r_t_mag[10]), paramsmagking[10,*]) , color=150, thick=3      ; Plot model                                
; magindx= magindx+1 
; IF cntsm[11] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[11] GT 4 THEN plot, rad_fit[indx21m_gt0], f[11,indx21m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[11], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[11] GT 4 THEN oploterror, rad_fit[indx21m_gt0], f[11,indx21m_gt0], f_err[11,indx21m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[11] GT 4 THEN oplot, FINDGEN(r_t_mag[11]), MPEVALEXPR(king, FINDGEN(r_t_mag[11]), paramsmagking[11,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[12] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[12] GT 4 THEN plot, rad_fit[indx22m_gt0], f[12,indx22m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[12], format="(f4.0)"), YTickFormat='(e7.0)'
; IF cntsm[12] GT 4 THEN oploterror, rad_fit[indx22m_gt0], f[12,indx22m_gt0], f_err[12,indx22m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[12] GT 4 THEN oplot, FINDGEN(r_t_mag[12]), MPEVALEXPR(king, FINDGEN(r_t_mag[12]), paramsmagking[12,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[13] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[13] GT 4 THEN plot, rad_fit[indx23m_gt0], f[13,indx23m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[13], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)" 
; IF cntsm[13] GT 4 THEN oploterror, rad_fit[indx23m_gt0], f[13,indx23m_gt0], f_err[13,indx23m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[13] GT 4 THEN oplot, FINDGEN(r_t_mag[13]), MPEVALEXPR(king, FINDGEN(r_t_mag[13]), paramsmagking[13,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[14] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[14] GT 4 THEN plot, rad_fit[indx24m_gt0], f[14,indx24m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[14], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
; IF cntsm[14] GT 4 THEN oploterror, rad_fit[indx24m_gt0], f[14,indx24m_gt0], f_err[14,indx24m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[14] GT 4 THEN oplot, FINDGEN(r_t_mag[14]), MPEVALEXPR(king, FINDGEN(r_t_mag[14]), paramsmagking[14,*]) , color=150, thick=3      ; Plot model
; magindx= magindx+1 
; IF cntsm[15] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
; IF cntsm[15] GT 4 THEN plot, rad_fit[indx25m_gt0], f[15,indx25m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[15], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
; IF cntsm[15] GT 4 THEN oploterror, rad_fit[indx25m_gt0], f[15,indx25m_gt0], f_err[15,indx25m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
; IF cntsm[15] GT 4 THEN oplot, FINDGEN(r_t_mag[15]), MPEVALEXPR(king, FINDGEN(r_t_mag[15]), paramsmagking[15,*]) , color=150, thick=3      ; Plot model
; multiplot, /reset
; multiplot,[1,1],/init
; 


; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; Creating the PS output

!p.font=0 	;Selecting better type font 


set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_rdp_all_king.eps'
ploterror, rad_fit[indx_to_fit_all], f_all[indx_to_fit_all], f_all_err[indx_to_fit_all], psym=SYMCAT(16), SYMSIZE=0.3, $
	 yrange=[min(f_all), max(f_all)], YTickFormat='exponent_labels', XTickFormat="(g0)", xtit='radial distance [arcsec]', ytit='density [stars/arcmin!u2!n]', tit='RDP for the cluster '+cluster_name,  /XLOG, /YLOG 
oplot, FINDGEN(r_t_allk), MPEVALEXPR(king, FINDGEN(r_t_allk), paramsall) , thick=2, color=FSC_COLOR("ForestGreen")       	; Plot model
device, /close_file
set_plot, 'X'  &  !p.font=-1

set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=18,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_rdp_brfa_king.eps'
multiplot, [1,2], ygap=0.02
ploterror, rad_fit[indx_to_fit_br], f_br[indx_to_fit_br], f_br_err[indx_to_fit_br], psym=SYMCAT(4), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r],  $ 
 		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit='Bright stars V < 20', ytit=TeXtoIDL("density [stars/arcmin^2]")
oplot, FINDGEN(r_t_brk), MPEVALEXPR(king , FINDGEN(r_t_brk), paramsbrk) , color=FSC_COLOR("blue"), thick=3              	; Plot model
multiplot & ploterror, rad_fit[indx_to_fit_fa], f_fa[indx_to_fit_fa], f_fa_err[indx_to_fit_fa], psym=SYMCAT(15), xrange=[rad_fit[0], (rad(n_elements(rad_fit)-1))+step_r], $ 
		 YTickFormat='exponent_labels',  /XLOG, /YLOG, tit=TeXtoIDL("Faint stars 20 \leq V \leq 25"), xtit='r [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]")
oplot, FINDGEN(r_t_fak), MPEVALEXPR(king , FINDGEN(r_t_fak), paramsfak) , color=FSC_COLOR("Red"), thick=3              	; Plot model
multiplot, /reset
multiplot,[1,1],/init
device, /close_file
set_plot, 'X'  &  !p.font=-1


minmagplot= 16  -10
maxmagplot= 24  -10

SET_PLOT, 'PS'   &  !p.font= 0
device, SET_FONT='Times', /TT_Font
device, /ENCAPSULATED, /Times, /PORTRAIT, xsize=8.7,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_Rc_king.eps'
ploterror, (0.5*step_mag+mags[minmagplot:maxmagplot]), r_c_mag[minmagplot:maxmagplot], CMREPLICATE(0.5,n_elements(mags[minmagplot:maxmagplot])), r_c_mag_err[minmagplot:maxmagplot], psym=SYMCAT(16), SYMSIZE=0.5, xrange=[14,26], xtit='V', ytit=TeXtoIDL("r_c [arcsec]")   ;, tit=TeXtoIDL("The core radii for ")+cluster_name
oploterror, [(20+MIN(mv))/2], [r_c_brk], [(20-MIN(mv))/2],[r_c_brk_err], psym=SYMCAT(16), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("Black"), ERRCOLOR=FSC_COLOR("Black")
oploterror, [(mags[MaxMagIndx]+1+20)/2], [r_c_fak], [(mags[MaxMagIndx]+1-20)/2],[r_c_fak_err], psym=SYMCAT(14), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("Black"), ERRCOLOR=FSC_COLOR("Black")
oploterror, [(mags[MaxMagIndx]+1+MIN(mv))/2], [r_c_allk],[(mags[MaxMagIndx]+1-MIN(mv))/2],[r_c_allk_err], psym=SYMCAT(15), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("Black"), ERRCOLOR=FSC_COLOR("Black")
oploterror, (0.5*step_mag+mags[minmagplot:maxmagplot]), r_c_mag[minmagplot:maxmagplot], CMREPLICATE(0.5,n_elements(mags[minmagplot:maxmagplot])), r_c_mag_err[minmagplot:maxmagplot], psym=SYMCAT(16), SYMSIZE=0.5  ;overplotting the points again
DEVICE, /CLOSE_FILE
SET_PLOT, 'X'   &  !p.font= -1


SET_PLOT, 'PS'
device, SET_FONT='Times', /TT_Font
device, /ENCAPSULATED, /Times, /PORTRAIT, xsize=8.7,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_Rt_king.eps'
ploterror, (0.5*step_mag+mags[3:*]), r_t_mag[3:*], CMREPLICATE(0.5,n_elements(mags[3:*])), r_t_mag_err[3:*], psym=SYMCAT(16), xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 150], xtit='V', ytit=TeXtoIDL("r_t [arcsec]")     ;, tit=TeXtoIDL("The tidal radii for ")+cluster_name
oploterror, [17.5], [r_t_brk], [2.5],[r_t_brk_err], psym=SYMCAT(17), thick=1, COLOR=FSC_COLOR("blue"), ERRCOLOR=FSC_COLOR("blue")
oploterror, [22.5], [r_t_fak], [2.5],[r_t_fak_err], psym=SYMCAT(4), thick=1, COLOR=FSC_COLOR("red"), ERRCOLOR=FSC_COLOR("red")
oploterror, [20.0], [r_t_allk],[5.0],[r_t_allk_err], psym=SYMCAT(15), thick=1, COLOR=FSC_COLOR("ForestGreen"), ERRCOLOR=FSC_COLOR("ForestGreen")
DEVICE, /CLOSE_FILE
set_plot, 'X'  &  !p.font=-1


set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_rdp_mags_king.eps'
multiplot, [3,4], ygap=0.02, xgap=0.04
magindx=  1          
IF cntsm[ 1] GT 4 THEN plot, rad_fit[indx11m_gt0], f[1,indx11m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[1], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 1] GT 4 THEN oploterror, rad_fit[indx11m_gt0], f[1,indx11m_gt0], f_err[1,indx11m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 1] GT 4 THEN oplot, FINDGEN(r_t_mag[ 1]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 1]), paramsmagking[1,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 2] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 2] GT 4 THEN plot, rad_fit[indx12m_gt0], f[2,indx12m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[2], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 2] GT 4 THEN oploterror, rad_fit[indx12m_gt0], f[2,indx12m_gt0], f_err[2,indx12m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 2] GT 4 THEN oplot, FINDGEN(r_t_mag[ 2]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 2]), paramsmagking[2,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 3] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 3] GT 4 THEN plot, rad_fit[indx13m_gt0], f[3,indx13m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[3], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 3] GT 4 THEN oploterror, rad_fit[indx13m_gt0], f[3,indx13m_gt0], f_err[3,indx13m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 3] GT 4 THEN oplot, FINDGEN(r_t_mag[ 3]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 3]), paramsmagking[3,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 4] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 4] GT 4 THEN plot, rad_fit[indx14m_gt0], f[4,indx14m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[4], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 4] GT 4 THEN oploterror, rad_fit[indx14m_gt0], f[4,indx14m_gt0], f_err[4,indx14m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 4] GT 4 THEN oplot, FINDGEN(r_t_mag[ 4]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 4]), paramsmagking[4,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 5] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 5] GT 4 THEN plot, rad_fit[indx15m_gt0], f[5,indx15m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[5], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 5] GT 4 THEN oploterror, rad_fit[indx15m_gt0], f[5,indx15m_gt0], f_err[5,indx15m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 5] GT 4 THEN oplot, FINDGEN(r_t_mag[ 5]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 5]), paramsmagking[5,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 6] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 6] GT 4 THEN plot, rad_fit[indx16m_gt0], f[6,indx16m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[6], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 6] GT 4 THEN oploterror, rad_fit[indx16m_gt0], f[6,indx16m_gt0], f_err[6,indx16m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 6] GT 4 THEN oplot, FINDGEN(r_t_mag[ 6]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 6]), paramsmagking[6,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 7] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 7] GT 4 THEN plot, rad_fit[indx17m_gt0], f[7,indx17m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[7], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 7] GT 4 THEN oploterror, rad_fit[indx17m_gt0], f[7,indx17m_gt0], f_err[7,indx17m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 7] GT 4 THEN oplot, FINDGEN(r_t_mag[ 7]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 7]), paramsmagking[7,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 8] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 8] GT 4 THEN plot, rad_fit[indx18m_gt0], f[8,indx18m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[8], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 8] GT 4 THEN oploterror, rad_fit[indx18m_gt0], f[8,indx18m_gt0], f_err[8,indx18m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 8] GT 4 THEN oplot, FINDGEN(r_t_mag[ 8]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 8]), paramsmagking[8,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[ 9] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[ 9] GT 4 THEN plot, rad_fit[indx19m_gt0], f[9,indx19m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[9], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[ 9] GT 4 THEN oploterror, rad_fit[indx19m_gt0], f[9,indx19m_gt0], f_err[9,indx19m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[ 9] GT 4 THEN oplot, FINDGEN(r_t_mag[ 9]), MPEVALEXPR(king, FINDGEN(r_t_mag[ 9]), paramsmagking[9,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[10] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[10] GT 4 THEN plot, rad_fit[indx20m_gt0], f[10,indx20m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[10], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[10] GT 4 THEN oploterror, rad_fit[indx20m_gt0], f[10,indx20m_gt0], f_err[10,indx20m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[10] GT 4 THEN oplot, FINDGEN(r_t_mag[10]), MPEVALEXPR(king, FINDGEN(r_t_mag[10]), paramsmagking[10,*]) , color=150, thick=3      ; Plot model                                
magindx= magindx+1 
IF cntsm[11] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[11] GT 4 THEN plot, rad_fit[indx21m_gt0], f[11,indx21m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[11], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[11] GT 4 THEN oploterror, rad_fit[indx21m_gt0], f[11,indx21m_gt0], f_err[11,indx21m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[11] GT 4 THEN oplot, FINDGEN(r_t_mag[11]), MPEVALEXPR(king, FINDGEN(r_t_mag[11]), paramsmagking[11,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[12] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[12] GT 4 THEN plot, rad_fit[indx22m_gt0], f[12,indx22m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[12], format="(f4.0)"), YTickFormat='(e7.0)'
IF cntsm[12] GT 4 THEN oploterror, rad_fit[indx22m_gt0], f[12,indx22m_gt0], f_err[12,indx22m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[12] GT 4 THEN oplot, FINDGEN(r_t_mag[12]), MPEVALEXPR(king, FINDGEN(r_t_mag[12]), paramsmagking[12,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[13] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[13] GT 4 THEN plot, rad_fit[indx23m_gt0], f[13,indx23m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[13], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)" 
IF cntsm[13] GT 4 THEN oploterror, rad_fit[indx23m_gt0], f[13,indx23m_gt0], f_err[13,indx23m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[13] GT 4 THEN oplot, FINDGEN(r_t_mag[13]), MPEVALEXPR(king, FINDGEN(r_t_mag[13]), paramsmagking[13,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[14] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[14] GT 4 THEN plot, rad_fit[indx24m_gt0], f[14,indx24m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[14], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
IF cntsm[14] GT 4 THEN oploterror, rad_fit[indx24m_gt0], f[14,indx24m_gt0], f_err[14,indx24m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[14] GT 4 THEN oplot, FINDGEN(r_t_mag[14]), MPEVALEXPR(king, FINDGEN(r_t_mag[14]), paramsmagking[14,*]) , color=150, thick=3      ; Plot model
magindx= magindx+1 
IF cntsm[15] GT 4  AND magindx GT MinMagIndx+1 THEN    multiplot, /DOYAXIS  
IF cntsm[15] GT 4 THEN plot, rad_fit[indx25m_gt0], f[15,indx25m_gt0], psym=SYMCAT(16), SYMSIZE=0.3, /XLOG, /YLOG, title=STRING(mags[15], format="(f4.0)"), YTickFormat='(e7.0)', xtit='r [arcsec]', XTickFormat="(g0)"
IF cntsm[15] GT 4 THEN oploterror, rad_fit[indx25m_gt0], f[15,indx25m_gt0], f_err[15,indx25m_gt0], psym=SYMCAT(16), SYMSIZE=0.3
IF cntsm[15] GT 4 THEN oplot, FINDGEN(r_t_mag[15]), MPEVALEXPR(king, FINDGEN(r_t_mag[15]), paramsmagking[15,*]) , color=150, thick=3      ; Plot model
multiplot, /reset
multiplot,[1,1],/init
device, /close_file
set_plot, 'X'  &  !p.font=-1

; plotting Error bars on the CMD
 indx= WHERE(HISTOGRAM(mv, MIN=10., MAX=30, BINSIZE=step_mag, REVERSE_INDICES=rimag) NE 0)
 clustmags= 0.5*step_mag+mags[indx]
 clustmags_err= fltarr(n_elements(clustmags))
 FOR i=MIN(indx), n_elements(clustmags)+MIN(indx)-1   DO clustmags_err[i-MIN(indx)]= MEAN( emv[rimag[rimag[i]:rimag[i+1]-1]]  )
 clustcolor_err=  fltarr(n_elements(clustmags))
 FOR i=MIN(indx), n_elements(clustmags)+MIN(indx)-1   DO clustcolor_err[i-MIN(indx)]= MEAN( ecol[rimag[rimag[i]:rimag[i+1]-1]]  )
 
set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_cmd.eps'
plot, col, mv, psym=SYMCAT(16), SYMSIZE=0.1, xran=[-0.5,2], yran=[26,14], xtit='V - I', ytit='V'  ; , tit=cluster_name+' CMD'
oploterror, CMREPLICATE(-0.25, n_elements(clustmags)), clustmags, clustcolor_err, clustmags_err,  psym=SYMCAT(3)
device, /close_file
set_plot, 'X'  &  !p.font=-1


set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_cmd_inmid.eps'
!p.multi=[0,2,1,0,0]
multiplot, xgap=0.02
plot, col[WHERE(d_as LT rad[1])], mv[WHERE(d_as LT rad[1])], psym=1, SYMSIZE=0.2, xran=[-0.5,2], yran=[24,14], xtit='V - I', ytit='V', tit='CMD between '+STRING(rad[0]-step_r,format='(i1)')+'-'+STRING(rad[1],format='(i1)')+' arcsec'
oplot, col[WHERE(d_as LT rad[1] AND mv LE 18)], mv[WHERE(d_as LT rad[1] AND mv LE 18)], psym=2, SYMSIZE=0.4
multiplot & plot, col[WHERE(d_as GE 20 AND d_as LT 24)], mv[WHERE(d_as GE 20 AND d_as LT 24)], psym=1, SYMSIZE=0.2, xran=[-0.5,2], yran=[26,14], xtit='V - I', $
                  tit='CMD between '+STRING( 20,format='(i2)')+'-'+STRING( 24,format='(i2)')+' arcsec'
            oplot, col[WHERE(d_as GE 20 AND d_as LT 24 AND mv LE 18)], mv[WHERE(d_as GE 20 AND d_as LT 24 AND mv LE 18)], psym=2, SYMSIZE=0.4
multiplot, /reset
multiplot,[1,1],/init
device, /close_file
set_plot, 'X'  &  !p.font=-1

 set_plot,'PS'  &  !p.font=0  
 device, SET_FONT='Times', /TT_Font
 device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=8.7,$
 filename='/home/grinikolov/Desktop/'+ cluster_name +'_cmd_inout.eps'
 !p.multi=[0,2,1,0,0]
 multiplot, xgap=0.02
 plot, col[WHERE(d_as LE rad[3])], mv[WHERE(d_as LE rad[3])], psym=SYMCAT(16),SYMSIZE=0.25, xran=[-0.5,2], yran=[24,14], xtit='V - I', ytit='V', tit='CMD between '+STRING(0,format='(i3)')+'-'+STRING(rad[3],format='(i3)')+' arcsec'
 multiplot & plot, col[WHERE(d_as LE max_rad_fit AND d_as GT (max_rad_fit-2*step_r),nels)], mv[WHERE(d_as LE max_rad_fit AND d_as GT (max_rad_fit-2*step_r),nels)], psym=SYMCAT(16),SYMSIZE=0.25, xran=[-0.5,2], yran=[24,14], xtit='V - I', $ 
                                    tit='CMD between '+STRING(max_rad_fit-2*step_r,format='(i3)')+'-'+STRING(max_rad_fit,format='(i3)')+' arcsec'
 multiplot, /reset
 multiplot,[1,1],/init
 device, /close_file
 set_plot, 'X'  &  !p.font=-1

set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_cmds.eps'
multiplot, [n_elements(mags)/4,4], xgap=0.02, ygap=0.02
plot, col(WHERE(d_as GT rad[0] AND d_as LE rad[1])), mv(WHERE(d_as GT rad[0] AND d_as LE rad[1])), psym=3, xran=[-1,2], yran=[30,15], tit=STRING(FIX(rad[0]))+" arcsec", ytit="V [mag]"
FOR j=1, (n_elements(mags)-2) DO BEGIN  &$
	multiplot &$
	index= WHERE(d_as GT rad[j] AND d_as LE rad[j+1], cntindex) &$
	IF cntindex GT 0 THEN plot, col(index), mv(index), psym=3, xran=[-1,2], yran=[30,15], tit=STRING(FIX(rad[j]))+" arcsec" &$
ENDFOR
multiplot, /reset
multiplot,[1,1],/init
device, /close_file
set_plot, 'X'  &  !p.font=-1


set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_completeness.eps'
plot, mags, compl_mags, thick=4, xran=[13,27], xstyle=1, xtit="V", ytit="Completeness factor"   ;, tit="Completeness function"
device, /close_file
set_plot, 'X'  &  !p.font=-1

set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
filename='/home/grinikolov/Desktop/'+ cluster_name +'_completeness_mags.eps'
multiplot, [(n_elements(rad_fit)-2)/4,n_elements(mags)/4], xgap=0.02, ygap=0.03
plot, mags, complete_arr[*,0], title=STRING(rad_fit[0], format='(f4.1, " asec")'), thick=2 , xtit='magnitude', ytit='completeness', CHARSIZE=0.7
;oplot, mags, completeness_arr[*,0], color=FSC_COLOR("red") 
oplot, mags, (complete_arr[*,0] * completeness_correction[*,0]), color=FSC_COLOR("blue")
oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")
FOR j=1, (n_elements(rad_fit)-2) DO BEGIN  &$
	multiplot &$
	plot, mags, complete_arr[*,j], title=STRING(rad_fit[j],format='(f4.1, " asec")'), thick=2, CHARSIZE=0.7 &$
;	oplot, mags, completeness_arr[*,j], color=FSC_COLOR("red") &$
	oplot, mags, (complete_arr[*,j] * completeness_correction[*,j]), color=FSC_COLOR("blue") &$
	oplot, mags, REPLICATE(completeness_limit, n_elements(mags)-1),color=FSC_COLOR("red")  &$
ENDFOR
multiplot, /reset
multiplot,[1,1],/init
device, /close_file
set_plot, 'X'  &  !p.font=-1



!p.font=-1 	;Selecting normal font type
;;; end of PS output



;;; stop    ;prevent creation of PS files
;;;
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_LF.eps'
;;; plothist, mv, bin=lfbin, thick=3, /boxplot, xtit='magnitude', ytit='Number of stars', title='LF for '+cluster_name
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_fn.eps'
;;; ploterror, rad, f_n_all, f_n_all_err, psym=2, xtit='radius [arcsec]', ytit=TeXtoIDL("density [stars/arcmin^2]"), tit=cluster_name+' NDP'
;;; oplot, rad_fit[indx_to_fit_all], MPEVALEXPR(elson, rad_fit[indx_to_fit_all], params_els) , color=FSC_COLOR("red"), thick=2 			; Plot model
;;; oplot, rad_fit, REPLICATE(bkg_fitted_all, n_elements(rad_fit)), color=FSC_COLOR("DeepPink")
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; 
;;; 
;;; SET_PLOT, 'PS'
;;; device, SET_FONT='Times', /TT_Font
;;; device, /ENCAPSULATED, /Times, /Courier, /PORTRAIT, xsize=8.7,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_Rc.eps'
;;; ploterror, [(0.5*step_mag+mags[1:*]),17.5,22.5,20.0], [r_core_mag[1:*],r_core_br,r_core_fa,r_core_all], [REPLICATE(step_mag/2,n_elements(mags[1:*])),2.5,2.5,5.0], [boot_Rcmag_err[1:*],boot_Rcbr_err,boot_Rcfa_err,boot_Rc_err], /NODATA , $
;;;     xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit='Core radius [arcsec]' , tit= cluster_name
;;; oploterror, (0.5*step_mag+mags[1:*]), r_core_mag[1:*], REPLICATE(step_mag/2,n_elements(mags[1:*])), boot_Rcmag_err[1:*], psym=SYMCAT(15)
;;; oploterror, [17.5], [r_core_br],[2.5],[boot_Rcbr_err], psym=SYMCAT(17), thick=1, ERRCOLOR=FSC_COLOR("blue")
;;; oploterror, [22.5], [r_core_fa],[2.5],[boot_Rcfa_err], psym=SYMCAT(4), thick=1, ERRCOLOR=FSC_COLOR("red")
;;; oploterror, [20.0], [r_core_all],[5.0],[boot_Rc_err], psym=SYMCAT(15), thick=1, ERRCOLOR=FSC_COLOR("ForestGreen")
;;; DEVICE, /CLOSE_FILE
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_gamma_mags.eps'
;;; ploterror, mags[0:*], paramsmagels[0:*,2], REPLICATE(1.0,n_elements(mags[0:*])), gamma_mag_err[0:*], psym=SYMCAT(15), xrange=[mags[0],mags(n_elements(mags)-1)], yrange=[0, 20], xtit='magnitude', ytit="gamma", tit=TeXtoIDL("The slope \gamma of the EFF fit")
;;; oploterror, [17,19,22], [paramsbr[2], params_els[2], paramsfa[2]],[3,5,2],[0,0,0], psym=2
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_eff_a_mags.eps'
;;; ploterror, (0.5*step_mag+mags[1:*]), eff_a_mag[1:*], REPLICATE(1.0,n_elements(mags[1:*])), eff_a_mag_err[1:*], psym=2, $ 
;;;  	xrange=[mags[0],mags(n_elements(mags)-1)], xtit='magnitude', ytit='EFF a [arcsec]', yran=[0,MAX(eff_a_mag)] , tit="Elson a(mag)"
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_n_st_mags.eps'
;;; multiplot, [4,5], ygap=0.02
;;; ploterror, rad_fit[indx_to_fit_br], n_st_br, n_st_br_err, psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st_br)], /YLOG, title='V < 20 mag' , ytit='number of stars', xtit='r [arcsec]'
;;; multiplot & IF cntsm[ 2] GT 4 THEN  ploterror, rad_fit, n_st[2,*], n_st_err[2,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[2], format="(f4.1)")
;;; multiplot & IF cntsm[ 3] GT 4 THEN  ploterror, rad_fit, n_st[3,*], n_st_err[3,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[3], format="(f4.1)") 
;;; multiplot & IF cntsm[ 4] GT 4 THEN  ploterror, rad_fit, n_st[4,*], n_st_err[4,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[4], format="(f4.1)")
;;; multiplot & IF cntsm[ 5] GT 4 THEN  ploterror, rad_fit, n_st[5,*], n_st_err[5,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[5], format="(f4.1)"), ytit='number of stars' 
;;; multiplot & IF cntsm[ 6] GT 4 THEN  ploterror, rad_fit, n_st[6,*], n_st_err[6,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[6], format="(f4.1)") 
;;; multiplot & IF cntsm[ 7] GT 4 THEN  ploterror, rad_fit, n_st[7,*], n_st_err[7,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[7], format="(f4.1)") 
;;; multiplot & IF cntsm[ 8] GT 4 THEN  ploterror, rad_fit, n_st[8,*], n_st_err[8,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[8], format="(f4.1)")
;;; multiplot & IF cntsm[ 9] GT 4 THEN  ploterror, rad_fit, n_st[9,*], n_st_err[9,*],   psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[9], format="(f4.1)"), ytit='number of stars'  
;;; multiplot & IF cntsm[10] GT 4 THEN  ploterror, rad_fit, n_st[10,*], n_st_err[10,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[10], format="(f4.1)")
;;; multiplot & IF cntsm[11] GT 4 THEN  ploterror, rad_fit, n_st[11,*], n_st_err[11,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[11], format="(f4.1)") 
;;; multiplot & IF cntsm[12] GT 4 THEN  ploterror, rad_fit, n_st[12,*], n_st_err[12,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[12], format="(f4.1)")
;;; multiplot & IF cntsm[13] GT 4 THEN  ploterror, rad_fit, n_st[13,*], n_st_err[13,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[13], format="(f4.1)"), ytit='number of stars'  
;;; multiplot & IF cntsm[14] GT 4 THEN  ploterror, rad_fit, n_st[14,*], n_st_err[14,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[14], format="(f4.1)") 
;;; multiplot & IF cntsm[15] GT 4 THEN  ploterror, rad_fit, n_st[15,*], n_st_err[15,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[15], format="(f4.1)")
;;; multiplot & IF cntsm[16] GT 4 THEN  ploterror, rad_fit, n_st[16,*], n_st_err[16,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[16], format="(f4.1)")
;;; multiplot & IF cntsm[17] GT 4 THEN  ploterror, rad_fit, n_st[17,*], n_st_err[17,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[17], format="(f4.1)"), xtit='r [arcsec]', ytit='number of stars'
;;; multiplot & IF cntsm[18] GT 4 THEN  ploterror, rad_fit, n_st[18,*], n_st_err[18,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[18], format="(f4.1)"), xtit='r [arcsec]'
;;; multiplot & IF cntsm[19] GT 4 THEN  ploterror, rad_fit, n_st[19,*], n_st_err[19,*], psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st)], /YLOG, title=STRING(mags[19], format="(f4.1)"), xtit='r [arcsec]'
;;; multiplot &  ploterror, rad_fit[indx_to_fit_fa], n_st_fa, n_st_fa_err,  psym=2, xrange=[1, (rad(n_elements(rad)-1))], xstyle=1, yrange=[1., max(n_st_fa)], /YLOG, title=TeXtoIDL("V \geq 20"), xtit='r [arcsec]', ytit='number of stars' 
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=18,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_xy_mags.eps'
;;; multiplot, [n_elements(rad)/4,4], xgap=0.02, ygap=0.02
;;; FOR j=1, (n_elements(mags)-2) DO BEGIN  &$
;;; 	multiplot &$
;;; 	index= WHERE(mv GT mags[j] AND mv LE mags[j+1], cntindex) &$
;;; 	IF cntindex GT 0 THEN plot, x(index), y(index), psym=3, xran=[-1600,1600], yran=[-1600,1600], /ISOTROPIC, tit=STRING(FIX(mags[j]))+" mag" &$
;;; ENDFOR
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; set_plot,'PS'  &  !p.font=0  
;;; device, SET_FONT='Times', /TT_Font
;;; device,  /color,  /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=18,ysize=8.7,$
;;; filename='/home/grinikolov/Desktop/'+ cluster_name +'_cmd_inout.eps'
;;; !p.multi=[0,2,1,0,0]
;;; multiplot, xgap=0.02
;;; plot, col[WHERE(d_as LT rad[1])], mv[WHERE(d_as LT rad[1])], psym=3, xran=[-1,2], yran=[26,14], xtit='V - I', ytit='V magnitude', tit='CMD between '+STRING(rad[0]-step_r,format='(i1)')+'-'+STRING(rad[1],format='(i1)')+' arcsec'
;;; multiplot & plot, col[WHERE(d_as GE rad[n_elements(rad_fit)-2] AND d_as LT rad[n_elements(rad_fit)-1])], mv[WHERE(d_as GE rad[n_elements(rad_fit)-2] AND d_as LT rad[n_elements(rad_fit)-1])], psym=3, xran=[-1,2], yran=[26,14], xtit='V - I', $
;;;                   tit='CMD between '+STRING( rad[n_elements(rad_fit)-2],format='(i2)')+'-'+STRING( rad[n_elements(rad_fit)-1],format='(i2)')+' arcsec'
;;; multiplot, /reset
;;; multiplot,[1,1],/init
;;; device, /close_file
;;; set_plot, 'X'  &  !p.font=-1
;;; 
;;; 
;;; 
;;; !p.font=-1 	;Selecting normal font type
;;; ;;; end of PS output

spawn, 'source ~/Desktop/change_IDL_Title.sh'
stop , cluster_name, ' Radial step =', FIX(step_r), ' [arcsec]'
end
