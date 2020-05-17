PRO M15PM

Readcol, '~/ADATA/work/old_plates/reduced/radec/matched_5.pht', format='d,d,f,f,i,f,f,d,d,f,f,i,f,f,d,d,f,f,i,f,f,d,d,f,f,i,f,f,d,d,f,f,i,f,f',ra_1, dec_1, x_1, y_1, id_1, mag_1, merr_1, ra_2, dec_2, x_2, y_2, id_2, mag_2, merr_2, ra_3, dec_3, x_3, y_3, id_3, mag_3, merr_3, ra_4, dec_4, x_4, y_4, id_4, mag_4, merr_4, ra_5, dec_5, x_5, y_5, id_5, mag_5, merr_5, NLINES=nstars

juldate, [1935,11,22], jdyear_1  ;crop241w.fits  	1935-11-22T00:00:00	
juldate, [1937,10,23], jdyear_2  ;crop419w.fits  	1937-10-23T00:00:00	
juldate, [1968,09,30], jdyear_3  ;crop8741w.fits 	1968-09-30T00:00:00	
juldate, [1979,12,08], jdyear_4  ;crop12289w.fits	1979-12-08T00:00:00	
juldate, [1980,08,08], jdyear_5  ;crop12659w.fits	1980-08-08T00:00:00	

window, 1, xsize=800, ysize=800, tit='RA DEC differences plot'
 plot, (ra_1-ra_2)*cos(dec_2),dec_1-dec_2, psym=3, color=FSC_COLOR("white"), ystyle=1, /ISOTROPIC &$ 
oplot, (ra_3-ra_2)*cos(dec_2),dec_3-dec_2, psym=3, color=FSC_COLOR("red") &$ 
oplot, (ra_4-ra_2)*cos(dec_2),dec_4-dec_2, psym=3, color=FSC_COLOR("green") &$ 
oplot, (ra_5-ra_2)*cos(dec_2),dec_5-dec_2, psym=3, color=FSC_COLOR("blue")
oplot, intarr(100),findgen(100)-50, linestyle=1, color=FSC_COLOR("white") &$ 
oplot, intarr(10),findgen(10)-5   , linestyle=1, color=FSC_COLOR("white") &$

rd1 = TRANSPOSE([[ra_1], [dec_1]]) 
rd2 = TRANSPOSE([[ra_2], [dec_2]]) 
rd3 = TRANSPOSE([[ra_3], [dec_3]]) 
rd4 = TRANSPOSE([[ra_4], [dec_4]]) 
rd5 = TRANSPOSE([[ra_5], [dec_5]]) 

rdarr= [rd1,rd2,rd3,rd4,rd5]  

rdsub= fltarr(5,5,nstars)    ;the array, to contain the Proper Motions of the stars

pmr1 = TRANSPOSE([(ra_1 - ra_2)*cos(dec_2)]) & pmd1= transpose([(dec_1 - dec_2)])
pmr2 = TRANSPOSE([(ra_2 - ra_2)*cos(dec_2)]) & pmd2= transpose([(dec_2 - dec_2)])
pmr3 = TRANSPOSE([(ra_3 - ra_2)*cos(dec_2)]) & pmd3= transpose([(dec_3 - dec_2)])
pmr4 = TRANSPOSE([(ra_4 - ra_2)*cos(dec_2)]) & pmd4= transpose([(dec_4 - dec_2)])
pmr5 = TRANSPOSE([(ra_5 - ra_2)*cos(dec_2)]) & pmd5= transpose([(dec_5 - dec_2)])

oplot, pmr1,pmd1, psym=7, color=FSC_COLOR("white") &$ 
oplot, pmr3,pmd3, psym=7, color=FSC_COLOR("red") &$ 
oplot, pmr4,pmd4, psym=7, color=FSC_COLOR("green") &$ 
oplot, pmr5,pmd5, psym=7, color=FSC_COLOR("blue")

mr1= MEDIAN(pmr1,/DOUBLE) & md1 = MEDIAN(pmd1,/DOUBLE)
mr2= MEDIAN(pmr2,/DOUBLE) & md2 = MEDIAN(pmd2,/DOUBLE)
mr3= MEDIAN(pmr3,/DOUBLE) & md3 = MEDIAN(pmd3,/DOUBLE)
mr4= MEDIAN(pmr4,/DOUBLE) & md4 = MEDIAN(pmd4,/DOUBLE)
mr5= MEDIAN(pmr5,/DOUBLE) & md5 = MEDIAN(pmd5,/DOUBLE)

;oplot, pmr1-mr1,pmd1-md1, psym=6, color=FSC_COLOR("white") &$ 
;oplot, pmr3-mr3,pmd3-md3, psym=6, color=FSC_COLOR("red") &$ 
;oplot, pmr4-mr4,pmd4-md4, psym=6, color=FSC_COLOR("green") &$ 
;oplot, pmr5-mr5,pmd5-md5, psym=6, color=FSC_COLOR("blue")


STOP
END
