function Shine = ShineMaker(xu, xd, yu, yd, fx, fy, fl)
xm = xd + fx*(xu-xd); ym = yd + fx*(yu-yd);
c = floor(fy*numel(ym)); l = floor(fl*numel(ym));
indx = max(1, c-floor(l/2)):min(numel(ym),c+floor(l/2));
y = ym(indx); xl = xm(indx); xh = xm(indx); 
xs = [xh+0.002,flip(xl)-0.002]; ys = [y,flip(y)];
Shine.streak = fill(xs, ys, 'w', EdgeAlpha = 0.5);
Shine.fx = fx; Shine.fy = fy; Shine.l = l; Shine.popped = false;
Shine.Update = @(xu, xd, yu, yd, dt)update(xu, xd, yu, yd, dt);

    function shine = update(xu, xd, yu, yd, dt)
        if(~isempty(Shine.streak))
            fy = Shine.fy + 5*dt; Shine.fy = fy;
            xm = xd + Shine.fx*(xu-xd); ym = yd + Shine.fx*(yu-yd);
            c = floor(fy*numel(ym)); 
            indx = max(1, c-floor(Shine.l/2)):min(numel(ym),c+floor(l/2));
            y = ym(indx); xl = xm(indx); xh = xm(indx); 
            xs = [xh+0.002,flip(xl)-0.002]; ys = [y,flip(y)];
            Shine.streak.XData = xs; Shine.streak.YData = ys; 
            Shine.popped = fy >= 1;
        end
        shine = Shine; 
    end
end