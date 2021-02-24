function [y,del,snr] = quantization (x,l)

    xp = max(x);
    xn = min(x);
    del = (xp - xn)/l;

    lev = xn+del/2:del:xp-del/2;
    sig = (x - xn)/del + 1/2;
    ind = round(sig);
    ind = min(ind,l);
    y = lev(ind);

    snr = 20*log10(norm(x)/norm(x-y));

end