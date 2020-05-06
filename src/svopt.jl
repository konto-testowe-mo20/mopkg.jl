abstract type SVOptMethod end

struct SVHillClimb <: SVOptMethod end

function (svhc::SVHillClimb)(f, x0; ϵ, maxiter, dampingfactor=0.5, step=1.0)
    x, fp = x0, f(x0)
    s, fs = x0 + step, f(x0 + step)
    if fs > fp
        x, s = s, x
        fp, fs = fs, fp
        step = -step
    end
    i, fn = 0, Inf
    while abs(fn-fs) ≥ ϵ && i ≤ maxiter
        i += 1
        s += step
        fs = fn
        fn = f(s)
        if fn > fs
            step = -step*dampingfactor
        end
    end
    return s, fn
end

