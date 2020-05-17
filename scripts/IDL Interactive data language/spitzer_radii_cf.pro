PRO spitzer_radii_cf  

;
; Computes the spitzer radius for cluster.
; r_{Sp} = \sqrt{ \frac{\sum\limits_{i=1}^{N} {r_{i}}^2}{N} } 
;        errors in X and Y direction = 0.03 pixels. Assume 0.05 px. Then px-->arcsec and sum them in R_sp eq.

;;; <<<<<<   Reading input  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;  ;;; NGC 1711
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1711_King_session.idlsav"

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

;;; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;  ;;; NGC 1754
; restore, "/home/grigor/Desktop/clust_profiles/set2/fit_all/NGC 1754_King_session.idlsav"
; READCOL, '/home/grigor/Documents/hst/PropID5916/NGC1754/ngc1754re_sky_f0.5.phtcc'	, n, x, y, mv, emv, mi, emi, col, ecol, cf

;  ;;; NGC 2005
; restore, "/home/grigor/Desktop/clust_profiles/set2/fit_all/NGC 2005_King_session.idlsav"
; READCOL, '/home/grigor/Documents/hst/PropID5916/NGC2005/ngc2005re_sky_f0.5.phtcc'	, n, x, y, mv, emv, mi, emi, col, ecol, cf

  ;;; NGC 2019
 restore, "/home/grigor/Desktop/clust_profiles/set2/fit_all/NGC 2019_King_session.idlsav"
 READCOL, '/home/grigor/Documents/hst/PropID5916/NGC2019/ngc2019re_sky_f0.5.phtcc'	, n, x, y, mv, emv, mi, emi, col, ecol, cf

;;; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;; completeness_limit= 0.1
cfuse= WHERE(mv LT 25 AND cf GT completeness_limit, cfcnt)     ;Compl Factor of the stars that we will use
d_as_cfuse=d_as[cfuse]

mag14= WHERE(mv GT 14 and mv LT 15 and cf GT completeness_limit, countmag14)
mag15= WHERE(mv GT 15 and mv LT 16 and cf GT completeness_limit, countmag15)
mag16= WHERE(mv GT 16 and mv LT 17 and cf GT completeness_limit, countmag16)
mag17= WHERE(mv GT 17 and mv LT 18 and cf GT completeness_limit, countmag17)
mag18= WHERE(mv GT 18 and mv LT 19 and cf GT completeness_limit, countmag18)
mag19= WHERE(mv GT 19 and mv LT 20 and cf GT completeness_limit, countmag19)
mag20= WHERE(mv GT 20 and mv LT 21 and cf GT completeness_limit, countmag20)
mag21= WHERE(mv GT 21 and mv LT 22 and cf GT completeness_limit, countmag21)
mag22= WHERE(mv GT 22 and mv LT 23 and cf GT completeness_limit, countmag22)
mag23= WHERE(mv GT 23 and mv LT 24 and cf GT completeness_limit, countmag23)
mag24= WHERE(mv GT 24 and mv LT 25 and cf GT completeness_limit, countmag24)
mag25= WHERE(mv GT 25 and mv LT 26 and cf GT completeness_limit, countmag25)
mag26= WHERE(mv GT 26 and mv LT 27 and cf GT completeness_limit, countmag26)


;;; Calculating Spitzer radius
;;; All stars
spitzer_all= SQRT( TOTAL(d_as_cfuse^2/cf[cfuse]) / N_ELEMENTS(d_as_cfuse))   ; correcting for incompleteness by multiplying by the inverse of the completeness factor 'cf'
spitzer_all_err=SQRT( TOTAL(d_as_cfuse^2) / N_ELEMENTS(d_as_cfuse))


;;; Bright and Faint stars
spitzer_br= SQRT( TOTAL(d_as_cfuse[WHERE(mv LT 20.)]^2) / N_ELEMENTS(d_as_cfuse[WHERE(mv LT 20.)]))

spitzer_fa= SQRT( TOTAL(d_as_cfuse[WHERE(mv GE 20.)]^2) / N_ELEMENTS(d_as_cfuse[WHERE(mv GE 20.)]))

spitzer_mag= FLTARR(n_elements(mags))
IF countmag14 NE 0 THEN  spitzer_mag14= SQRT( TOTAL(d_as[mag14]^2) / N_ELEMENTS(d_as[mag14])) & IF countmag14 NE 0 THEN  spitzer_mag[04]=spitzer_mag14 
IF countmag15 NE 0 THEN  spitzer_mag15= SQRT( TOTAL(d_as[mag15]^2) / N_ELEMENTS(d_as[mag15])) & IF countmag15 NE 0 THEN  spitzer_mag[05]=spitzer_mag15 
IF countmag16 NE 0 THEN  spitzer_mag16= SQRT( TOTAL(d_as[mag16]^2) / N_ELEMENTS(d_as[mag16])) & IF countmag16 NE 0 THEN  spitzer_mag[06]=spitzer_mag16 
IF countmag17 NE 0 THEN  spitzer_mag17= SQRT( TOTAL(d_as[mag17]^2) / N_ELEMENTS(d_as[mag17])) & IF countmag17 NE 0 THEN  spitzer_mag[07]=spitzer_mag17 
IF countmag18 NE 0 THEN  spitzer_mag18= SQRT( TOTAL(d_as[mag18]^2) / N_ELEMENTS(d_as[mag18])) & IF countmag18 NE 0 THEN  spitzer_mag[08]=spitzer_mag18 
IF countmag19 NE 0 THEN  spitzer_mag19= SQRT( TOTAL(d_as[mag19]^2) / N_ELEMENTS(d_as[mag19])) & IF countmag19 NE 0 THEN  spitzer_mag[09]=spitzer_mag19 
IF countmag20 NE 0 THEN  spitzer_mag20= SQRT( TOTAL(d_as[mag20]^2) / N_ELEMENTS(d_as[mag20])) & IF countmag20 NE 0 THEN  spitzer_mag[10]=spitzer_mag20 
IF countmag21 NE 0 THEN  spitzer_mag21= SQRT( TOTAL(d_as[mag21]^2) / N_ELEMENTS(d_as[mag21])) & IF countmag21 NE 0 THEN  spitzer_mag[11]=spitzer_mag21 
IF countmag22 NE 0 THEN  spitzer_mag22= SQRT( TOTAL(d_as[mag22]^2) / N_ELEMENTS(d_as[mag22])) & IF countmag22 NE 0 THEN  spitzer_mag[12]=spitzer_mag22 
IF countmag23 NE 0 THEN  spitzer_mag23= SQRT( TOTAL(d_as[mag23]^2) / N_ELEMENTS(d_as[mag23])) & IF countmag23 NE 0 THEN  spitzer_mag[13]=spitzer_mag23 
IF countmag24 NE 0 THEN  spitzer_mag24= SQRT( TOTAL(d_as[mag24]^2) / N_ELEMENTS(d_as[mag24])) & IF countmag24 NE 0 THEN  spitzer_mag[14]=spitzer_mag24 
IF countmag25 NE 0 THEN  spitzer_mag25= SQRT( TOTAL(d_as[mag25]^2) / N_ELEMENTS(d_as[mag25])) & IF countmag25 NE 0 THEN  spitzer_mag[15]=spitzer_mag25 
IF countmag26 NE 0 THEN  spitzer_mag26= SQRT( TOTAL(d_as[mag26]^2) / N_ELEMENTS(d_as[mag26])) & IF countmag26 NE 0 THEN  spitzer_mag[16]=spitzer_mag26 

window, 0
erase & plot, ra, d_as, psym=3
oplot, ra, CMREPLICATE(spitzer_all, n_elements(d_as)), color=FSC_COLOR("DarkGreen") 
oplot, ra, CMREPLICATE(spitzer_br , n_elements(d_as)), color=FSC_COLOR("Blue") 
oplot, ra, CMREPLICATE(spitzer_fa , n_elements(d_as)), color=FSC_COLOR("Crimson") 
 
IF countmag14 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag14, n_elements(d_as)), color=255
IF countmag15 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag15, n_elements(d_as)), color=240
IF countmag16 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag16, n_elements(d_as)), color=230
IF countmag17 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag17, n_elements(d_as)), color=220
IF countmag18 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag18, n_elements(d_as)), color=210
IF countmag19 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag19, n_elements(d_as)), color=200
IF countmag20 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag20, n_elements(d_as)), color=190
IF countmag21 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag21, n_elements(d_as)), color=180
IF countmag22 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag22, n_elements(d_as)), color=170
IF countmag23 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag23, n_elements(d_as)), color=160
IF countmag24 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag24, n_elements(d_as)), color=150
IF countmag25 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag25, n_elements(d_as)), color=140
IF countmag26 NE 0 THEN  oplot, ra, CMREPLICATE(spitzer_mag26, n_elements(d_as)), color=130
 
 
 
window, 1
plot, mags, spitzer_mag, psym=SYMCAT(16), tit=cluster_name+'No CC corrected Spitzer radius vs. magnitude', xtit='V', ytit=TeXtoIDL("r_{Sp} [arcsec]")
oplot, [17.5], [spitzer_br],  psym=SYMCAT(14),SYMSIZE=3, color=FSC_COLOR("Blue")
oploterror, [20.0], [spitzer_all], [0.5], [spitzer_all_err], psym=SYMCAT(15),SYMSIZE=3, color=FSC_COLOR("DarkGreen")
oplot, [22.5], [spitzer_fa],  psym=SYMCAT(17),SYMSIZE=3, color=FSC_COLOR("Red")



STOP
END
