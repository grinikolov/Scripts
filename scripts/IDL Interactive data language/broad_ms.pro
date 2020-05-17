pro  broad_ms
SET_PLOT, 'X' & !p.font=-1 & multiplot, [1,1]    ; & !x.margin=[12,3]   ;Selecting normal font type & larger X margin for labels
windown=0

;;; Final photometry 
;
;READCOL, '/home/grinikolov/Documents/hst/ngc1711/ngc1711final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '1711'
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/ngc1984final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '1984'  
;READCOL, '/home/grinikolov/Documents/hst/ngc2004/ngc2004final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2004'
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/ngc2011final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2011'
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/ngc2031final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2031'
;READCOL, '/home/grinikolov/Documents/hst/ngc2121/ngc2121final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2121'
;READCOL, '/home/grinikolov/Documents/hst/ngc2157/ngc2157final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2157'
READCOL, '/home/grinikolov/Documents/hst/ngc2214/ngc2214final.pht', n, x, y, v, ev, i, ei, col, ecol & cluster_ngc= '2214'
;;;

;;;
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/redone_all/bsdl100_all.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/re_oldHSTphot/bsdl100_re_all.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/hstphot1-1-7-reorder/bsdl100_reord.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/all-coadd/bsdl100_coadd.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/no_sky/bsdl100no_sky.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/ngc1711/n1711a.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1711/reduced-hstphot/re_sky/ngc1711_re_sky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/3V+3I/old_hstphot/bs100_VIa.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/bsdl100/3V+3I/new_hstphot/bs100_VIa.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1711/ngc1711re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/ngc1850/n1850-Gilmore/n1850_photom.pht', n, x, y, v, ev, b, eb, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1850/reduced_hstphot/re_sky/ngc1850_re_sky.pht', n, x, y, v, ev, b, eb, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/ngc1898/reduced_hstphot/n1898a.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1898/reduced_hstphot/no_local_sky/ngc1898re_sky.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/NGC1898/ngc1898re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/PropID5916/NGC1898/ngc1898re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol

;
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/ngc1984_all.dat', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/all_reduced_hstphot/ngc1984all_images.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/all_reduced_hstphot/updated HSTphot_2009_Sept/ngc1984all_images.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/Sofia_2007_ngc1984/ngc1984_all.dat', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/all_reduced_hstphot/no_sky/ngc1984no_sky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc1984/ngc1984re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol



;READCOL, '/home/grinikolov/Documents/hst/ngc2011/n2011a.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/all_images/no_sky/ngc2011_re_sky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/all_images/no_sky/ngc2011_no_sky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/ngc2011_all.dat', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/all_images/hstphot_sept_2009_st-ecf/ngc2011_updated_stecf.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/all_images/hstphot_sept_2009_mast/ngc2011updated_mast.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/all_images/n2011c+5.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2011/ngc2011re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/ngc2031/n2031a.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/n2031_no_appcor.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/ngc2031re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Desktop/temporary/reduced_hstphot/n2031af5.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/compare_2017/n2031asold.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/compare_2017/ngc2031clust_localsky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/compare_2017/lcleannew/ngc2031clust_locsky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/compare_2017/rcleanresky/ngc2031clust_recsky.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2031/reduced_hstphot/2017resky/ngc2031final.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/PropID5916/NGC2019/ngc2019re_sky_f0.5.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/PropID5916/NGC2019/reduced_hstphot/ngc2019re_sky_f1.0.pht', n, x, y, v, ev, i, ei, col, ecol


;READCOL, '/home/grinikolov/Documents/hst/ngc2121/reduced_hstphot/ngc2121a.pht', n, x, y, v, ev, i, ei, col, ecol

;READCOL, '/home/grinikolov/Documents/hst/ngc2214/hstphot_set2/n2214set2b.pht', n, x, y, v, ev, i, ei, col, ecol
;READCOL, '/home/grinikolov/Documents/hst/ngc2214/ngc2214set1_re_sky.pht', n, x, y, v, ev, i, ei, col, ecol

red_MS= WHERE(v LE 18.0 and col GT -0.1 and col LT 0.75)
blue_MS= WHERE(v LE 18.0 and col LT -0.1 )
bright= WHERE(v LE 18.0 and col LT 0.75)
pc=  WHERE(x gt 0 and y gt 0)
wf2= WHERE(x lt 0 and y gt 0)
wf3= WHERE(x lt 0 and y lt 0)
wf4= WHERE(x gt 0 and y lt 0)

window,0, xsize=400, ysize=400, title="CMD"
plot, col, v, psym=3,  yrange=[26,15], /YSTYLE, xrange=[-1,2], title=' CMD', xtitle='V-I', ytitle='V [mag]'
oplot, col[wf2], v[wf2], psym=3, color=FSC_COLOR("yellow")
oplot, col[wf3], v[wf3], psym=3, color=FSC_COLOR("green")
oplot, col[wf4], v[wf4], psym=3, color=FSC_COLOR("blue")
oplot, col[pc],  v[pc],  psym=3, color=FSC_COLOR("red")
 xyouts, 1.50, 15.8, 'WFC2', color=FSC_COLOR("yellow")
 xyouts, 1.50, 16.2, 'WFC3', color=FSC_COLOR("green")
 xyouts, 1.50, 16.6, 'WFC4', color=FSC_COLOR("blue")
 xyouts, 1.50, 15.4,  'PC' , color=FSC_COLOR("red")


; plotting Error bars on the CMD
 mv=v & emv=ev
 step_mag= 1.0     & max_mag= 29.5
 mags= step_mag * indgen(20)+10.  
 indx= WHERE(HISTOGRAM(mv, MIN=10., MAX=30, BINSIZE=step_mag, REVERSE_INDICES=rimag) NE 0)
 clustmags= 0.5*step_mag+mags[indx]
 clustmags_err= fltarr(n_elements(clustmags))
 FOR j=MIN(indx), n_elements(clustmags)+MIN(indx)-1   DO clustmags_err[j-MIN(indx)]= MEAN( emv[rimag[rimag[j]:rimag[j+1]-1]]  )
 clustcolor_err=  fltarr(n_elements(clustmags))
 FOR j=MIN(indx), n_elements(clustmags)+MIN(indx)-1   DO clustcolor_err[j-MIN(indx)]= MEAN( ecol[rimag[rimag[j]:rimag[j+1]-1]]  )
oploterror, CMREPLICATE(-0.40, n_elements(clustmags)), clustmags, clustcolor_err*2, clustmags_err*2,  psym=SYMCAT(3), ERRTHICK=2, /NOHAT

;stop

;window, 1, title="WF4"
;erase
;plot, x(wf4),y(wf4), psym=2, color=200, /ISOTROPIC, xrange=[-1700,1700], yrange=[-1700,1700], xtitle='X, px', ytitle='Y, px'
;
;window, 2, title="BLUE stars"
;erase
;plot, x(blue_MS),y(blue_MS), psym=2, color=200, /ISOTROPIC, xrange=[-1700,1700], yrange=[-1700,1700], xtitle='X, px', ytitle='Y, px'
;
;window, 3, title="BRIGHT stars"
;erase
;plot, x(bright),y(bright), psym=2, color=200, /ISOTROPIC, xrange=[-1700,1700], yrange=[-1700,1700], xtitle='X, px', ytitle='Y, px'
;
;;; CORRECTING the APERTURE  CORRECTION !!!
;i_apcorr=i
;i_apcorr[wf3]= i_apcorr[wf3] +0.18 	; Here!
;c=v-i_apcorr				; The corrected color
;
;window, /free, xsize=800, ysize=800
;plot, c, v, psym=3,  yrange=[28,14], /YSTYLE, xrange=[-2,4], xticklen=1, yticklen=1, title='Aperture Corrected with +0.2 mag (Imag in WFC3)', xtitle='V-I', ytitle='V [mag]'
;oplot, c[wf3], v[wf3], psym=1


set_plot,'ps'    ;, yoffset=1.5,xoffset=0.5, ysize=10. , yoffset=-0.5,xoffset=0.5, xsize=8.7,ysize=8.7
device, SET_FONT='Times', /TT_Font
device,  /color,bits_per_pixel=8,/ENCAPSULATED, /PORTRAIT, xsize=8.7, yoffset=2.0,xoffset=0.5, $
filename='/home/grinikolov/Desktop/ngc'+cluster_ngc+'_cmdfinalBW.eps'
plot, col, v, psym=4, symsize=0.1,  yrange=[26,14], /YSTYLE, xrange=[-1,3], xtitle='V-I', ytitle='V [mag]' ,/NODATA , title='NGC '+cluster_ngc+' CMD final'
oplot, col[wf2], v[wf2], psym=4, symsize=0.21, color=00
oplot, col[wf4], v[wf4], psym=6, symsize=0.21, color=05
oplot, col[wf3], v[wf3], psym=7, symsize=0.21, color=10
oplot, col[pc],  v[pc],  psym=5, symsize=0.21, color=15
; xyouts, 2.0, 14.8, 'WFC2', color=FSC_COLOR("yellow")
; xyouts, 2.0, 15.2, 'WFC3', color=FSC_COLOR("green")
; xyouts, 2.0, 15.6, 'WFC4', color=FSC_COLOR("blue")
; xyouts, 2.0, 14.4,  'PC' , color=FSC_COLOR("red")

; plotting Error bars on the CMD
oploterror, CMREPLICATE(-0.50, n_elements(clustmags)), clustmags, clustcolor_err*2, clustmags_err*2,  psym=SYMCAT(3), ERRTHICK=2, /NOHAT


device, /close_file
set_plot, 'X'

stop
end
