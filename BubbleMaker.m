function Bubble = BubbleMaker(x,y,u,v,r,xs,ys,ymin)
atm = 1e5; gravity = 9.8; density = 1e3; gasconstant = 287;
Bubble.position = [x, y]; Bubble.u = [u, v]; 
Bubble.r = r; Bubble.popped = false; Bubble.ymin = ymin;
h = interp1(xs,ys,x);
p = atm + max(h-y)*gravity*density;
Bubble.p = p; Bubble.m = p*4*pi*r^3/3/(gasconstant*300); 
t = 2*pi*linspace(0,1,21);
Bubble.bob = fill(x+r*cos(t), y+r*sin(t), 'w', EdgeAlpha = 0.5);
Bubble.Update = @(xs, ys, dt)update(xs, ys, dt);
    function bubble = update(xs, ys, dt)
        h = interp1(xs,ys,Bubble.position(1));
        p = atm + max(0, h-Bubble.position(2))*gravity*density;
        r = Bubble.r*p/Bubble.p;
        F = gravity*density*4*pi*r^3/3;
        a = [0, 2e-4*F/Bubble.m]; v = Bubble.u + a*dt;
        Bubble.position = max(Bubble.ymin, Bubble.position + 0.5*(Bubble.u + v)*dt);
        Bubble.u = v; Bubble.r = r;
        Bubble.bob.XData = Bubble.position(1)+r*cos(t);
        Bubble.bob.YData = Bubble.position(2)+r*sin(t);
        if(p == atm) % pop
            Bubble.bob.EdgeAlpha = Bubble.bob.EdgeAlpha*0.3;
            Bubble.popped = Bubble.bob.EdgeAlpha < 0.05;
        end
        bubble = Bubble;
    end
end
