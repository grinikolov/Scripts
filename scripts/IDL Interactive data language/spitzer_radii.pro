PRO spitzer_radii  

;
; Computes the spitzer radius for cluster.
; r_{Sp} = \sqrt{ \frac{\sum\limits_{i=1}^{N} {r_{i}}^2}{N} } 
;        errors in X and Y direction = 0.03 pixels. Assume 0.05 px. Then px-->arcsec and sum them in R_sp eq.

;;; <<<<<<   Reading input  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;  ;;; NGC 1711
; restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1711_King_session.idlsav"

  ;;; NGC 1898
 restore, "/home/grigor/Desktop/clust_profiles/King_fits/current/NGC 1898_King_session.idlsav"

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

mag14= WHERE (mv gt 14 and mv lt 15, countmag14)
mag15= WHERE (mv gt 15 and mv lt 16, countmag15)
mag16= WHERE (mv gt 16 and mv lt 17, countmag16)
mag17= WHERE (mv gt 17 and mv lt 18, countmag17)
mag18= WHERE (mv gt 18 and mv lt 19, countmag18)
mag19= WHERE (mv gt 19 and mv lt 20, countmag19)
mag20= WHERE (mv gt 20 and mv lt 21, countmag20)
mag21= WHERE (mv gt 21 and mv lt 22, countmag21)
mag22= WHERE (mv gt 22 and mv lt 23, countmag22)
mag23= WHERE (mv gt 23 and mv lt 24, countmag23)
mag24= WHERE (mv gt 24 and mv lt 25, countmag24)
mag25= WHERE (mv gt 25 and mv lt 26, countmag25)
mag26= WHERE (mv gt 26 and mv lt 27, countmag26)


;;; Calculating Spitzer radius
;;; All stars
spitzer_all= SQRT( TOTAL(d_as^2) / N_ELEMENTS(d_as))
spitzer_all_err=SQRT( TOTAL(d_as^2) / N_ELEMENTS(d_as))


;;; Bright and Faint stars
spitzer_br= SQRT( TOTAL(d_as[WHERE(mv LT 20.)]^2) / N_ELEMENTS(d_as[WHERE(mv LT 20.)]))

spitzer_fa= SQRT( TOTAL(d_as[WHERE(mv GE 20.)]^2) / N_ELEMENTS(d_as[WHERE(mv GE 20.)]))

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
oplot, ra, CMREPLICATE(spitzer_br, n_elements(d_as)), color=FSC_COLOR("Blue") 
oplot, ra, CMREPLICATE(spitzer_fa, n_elements(d_as)), color=FSC_COLOR("Crimson") 
 
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
oplot, [20.0], [spitzer_all], psym=SYMCAT(15),SYMSIZE=3, color=FSC_COLOR("DarkGreen")
oplot, [22.5], [spitzer_fa],  psym=SYMCAT(17),SYMSIZE=3, color=FSC_COLOR("Red")
 
 
 
 
 
















STOP
END
