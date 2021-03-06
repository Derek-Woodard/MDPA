function [ output_args ] = AddCurtainStream(num, x0, y0, PartAng, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

%set specifically for the AddElipAtomicArray shape
%set the stream to come down starting from an initial position to the left
%of the center point, and sweeping to a certain position on the right
%the min and max are always the same, and the particales are spaced evenly
%to fit that range

for p = 0:num - 1
    nAtoms = nAtoms + 1;    
    x(nAtoms) = AtomSpacing * (x0 - 5.159 + p * (10.318/num));
    y(nAtoms) = AtomSpacing * (y0 - Seper * p * sin(PartAng))/2;
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num
    Vx(nAtoms - num + p) = V * cos(PartAng);
    Vy(nAtoms - num + p) = V * sin(PartAng);
end

end
