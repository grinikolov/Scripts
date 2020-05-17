PRO  line_fit_Rcmag

; Fitting a line to the R_core vs. magnitude relation
;  to estimate some "degree of segregation
;
;
;;; <<<<< Reading input <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  ;;; NGC 1711
 restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1711_King_session.idlsav"

;  ;;; NGC 1898
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1898_King_session.idlsav"

;  ;;; NGC 1984
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1984_King_session.idlsav"

;  ;;; NGC 2011
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 2011_King_session.idlsav"

;  ;;; NGC 2031
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 2031_King_session.idlsav"

;  ;;; NGC 2157
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 2157_King_session.idlsav"

;  ;;; NGC 2214
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 2214_King_session.idlsav"

;;; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; using Absolute magnitudes
nmags= N_ELEMENTS(mags)
magsfit= mags + 0.5*step_mag 

;;; Line fitting
line= 'P[0]+ P[1]*x'
startline=[1.D, 0.2D]
Rcmagline= MPFITEXPR(line, magsfit[WHERE(r_c_mag GT 0)], r_c_mag[WHERE(r_c_mag GT 0)], r_c_mag_err[WHERE(r_c_mag GT 0)], startline, PERROR=perror_Rcmline,  BESTNORM=chi2_Rcmline, DOF=dof_Rcmline, NITER=niter_Rcmline)

 pcerror_Rcmline= perror_Rcmline * SQRT(chi2_Rcmline / dof_Rcmline) 
   constant= Rcmagline[0]  & constant_err= pcerror_Rcmline[0]
   slope=    Rcmagline[1]  & slope_err=    pcerror_Rcmline[1]

print, 'Constant', constant, ' \pm', constant_err
print,'Slope', slope,' \pm', slope_err

window, 0
ploterror, magsfit[WHERE(r_c_mag GT 0)], r_c_mag[WHERE(r_c_mag GT 0)], CMREPLICATE(0.5*step_mag, nmags), r_c_mag_err[WHERE(r_c_mag GT 0)], psym=SYMCAT(16), xtit='V', ytit=TeXtoIDL('r_c [arcsec]'), tit='The core radii for '+cluster_name
oplot, magsfit, MPEVALEXPR(line, magsfit, Rcmagline), thick=3
XYOUTS, 14,MAX(r_c_mag)-2, 'Slope:'+ STRING(slope, format="(f6.2)")


minmagplot= 15  -10
maxmagplot= 23  -10
set_plot,'PS'  &  !p.font=0  
device, SET_FONT='Times', /TT_Font
device, /color, /ENCAPSULATED, /Times, /PORTRAIT, yoffset=0.5,xoffset=0.5, xsize=8.7,ysize=8.7,$
filename='/home/grigor/Desktop/'+ cluster_name +'_linfit_Rcmag.eps'
ploterror, magsfit[minmagplot:maxmagplot], r_c_mag[minmagplot:maxmagplot], CMREPLICATE(0.5,n_elements(mags[minmagplot:maxmagplot])), r_c_mag_err[minmagplot:maxmagplot], psym=SYMCAT(16), xrange=[14,26], xtit='V', ytit=TeXtoIDL("r_c [arcsec]"), yrange=[0,MAX(r_c_mag[minmagplot:maxmagplot]+ r_c_mag_err[minmagplot:maxmagplot],/NAN)]  ;, tit='The core radii for '+cluster_name
oplot, magsfit, MPEVALEXPR(line, magsfit, Rcmagline), thick=3
;XYOUTS, 14,MAX(r_c_mag[minmagplot:maxmagplot]), 'Slope:'+ STRING(slope, format="(f6.2)")
XYOUTS, 19.8, 2, 'Slope:'+ STRING(slope, format="(f5.2)") + TeXtoIDL("\pm") + STRING(slope_err, format="(f4.2)")  ;MIN(r_c_mag[minmagplot:maxmagplot]-r_c_mag_err[minmagplot:maxmagplot],/NAN)-1
oploterror, [(20+MIN(mv))/2], [r_c_brk], [(20-MIN(mv))/2],[r_c_brk_err], psym=SYMCAT(16), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("DarkGrey"), ERRCOLOR=FSC_COLOR("DarkGrey")
oploterror, [(mags[MaxMagIndx]+1+20)/2], [r_c_fak], [(mags[MaxMagIndx]+1-20)/2],[r_c_fak_err], psym=SYMCAT(14), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("DarkGrey"), ERRCOLOR=FSC_COLOR("DarkGrey")
oploterror, [(mags[MaxMagIndx]+1+MIN(mv))/2], [r_c_allk],[(mags[MaxMagIndx]+1-MIN(mv))/2],[r_c_allk_err], psym=SYMCAT(15), SYMSIZE=1.5, ERRthick=2, COLOR=FSC_COLOR("DarkGrey"), ERRCOLOR=FSC_COLOR("DarkGrey")

device, /close_file
set_plot, 'X'  &  !p.font=-1



nmags= N_ELEMENTS(mags)
magsfit= mags + 0.5*step_mag

;;; Line fitting
line= 'P[0]+ P[1]*x'
startline=[-15.D,2.D]
Rcmagline= MPFITEXPR(line, magsfit[WHERE(r_c_mag GT 0)], r_c_mag[WHERE(r_c_mag GT 0)], r_c_mag_err[WHERE(r_c_mag GT 0)], startline, PERROR=perror_Rcmline,  BESTNORM=chi2_Rcmline, DOF=dof_Rcmline, NITER=niter_Rcmline)

 pcerror_Rcmline= perror_Rcmline * SQRT(chi2_Rcmline / dof_Rcmline) 
   constant= Rcmagline[0]  & constant_err= pcerror_Rcmline[0]
   slope=    Rcmagline[1]  & slope_err=    pcerror_Rcmline[1]

print, 'Constant', constant, ' \pm', constant_err
print,'Slope', slope,' \pm', slope_err


STOP
END
