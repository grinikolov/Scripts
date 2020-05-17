PRO sun_eclipse_percentage

READ_JPEG, 'G1N0030_crop.JPG', fff  ;The non-eclipsed Sun
ff= fff[2,*,*]                      ; taking only one layer, only one color of RGB
sunb= WHERE( ff GT 30 AND ff LT 200) ; selecting only the iluminated pixels of the Sun
arb= float(n_elements(sunb))
plot, histogram(ff, binsize=10), psym=10 ; Show how the histogram looks, the Sun is with values >> 0 < 256

READ_JPEG, 'G1N0009_crop.JPG', jjj
jj= jjj[2,*,*]
suna= WHERE( jj GT 30 AND jj LT 200)
ara= float(n_elements(suna))
oplot, histogram(jj, binsize=10)

part= (arb -ara ) / arb
print, part

stop
END
