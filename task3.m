## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala.
  new_X = zeros (m, n);
  
  % TODO: cast photo la double.
  photo = double(photo);

  % TODO: calculeaza media fiecarui rand al matricii.
  % Calcularea mediei pentru fiecare vector ai ∈ R1*n, i = 1:m
  row_means = mean(photo, 2);

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  % Repetarea mediei fiecărui element pentru a obține o matrice de aceeași dimensiune cu photo
  row_means_matrix = repmat(row_means, 1, n);
  
  % Actualizarea vectorilor ai ∈ R1*n, i = 1:m prin scăderea mediei μi
  new_X = photo - row_means_matrix;

  % TODO: calculeaza matricea de covarianta.
  Z = (new_X * new_X') / (n - 1);
  
  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V, S] = eig(Z);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  % Ordoneaza descrescător valorile proprii și creează matricea V
  % formată din vectorii proprii așezați pe coloane
  [~, indices] = sort(diag(S), 'descend');
  V = V(:, indices);
  
  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  % Păstrează doar primele pcs coloane din matricea V
  W = V(:, 1:pcs);
  
  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = W' * new_X;
  
  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale
  % TODO: aduna media randurilor scazuta anterior.
  approx_photo = W * Y + row_means_matrix;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(approx_photo);
endfunction
