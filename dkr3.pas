uses
  crt;

procedure menu;
begin
  TextColor(Green);
  writeln('Нажмите "1" чтобы осуществить ввод данных для вычислений.');
  TextColor(Red);
  writeln('Нажмите "2" чтобы осуществить вычисление площади фигуры.');
  TextColor(Yellow);
  writeln('Нажмите "3" чтобы вычислить погрешности.');
  TextColor(Blue);
  writeln('Нажмите "4" чтобы выйти из программы.');
end;

function func(x: real): real;
begin
  func := abs(1 * x * x * x + (-1) * x * x + (-4) * x + 17);
end;

var
  downx: real;
  upx: real;
  stepx: real;
  y1, y2: real;
  sq: real;
  x1: real;
  key: char;
  Efn: real;
  Ef: real;
  N: integer;

begin
  menu;
  repeat
    key := ReadKey;
    case key of
      '1':
        begin
          TextColor(Green);
          Writeln('Введите нижнюю границу интегрирования:');
          Readln(downx);
          Writeln('Введите верхнюю границу интегрирования:');
          Readln(upx);
          Writeln('Введите шаг интегрирования:');
          Readln(stepx);
          ClrScr;
          if (downx >= upx) or (stepx > upx) or (stepx < 0) then
          begin
            Writeln('Значения для вычислений введены некорректно! Выберете нужный пункт меню');
          end
          else
            TextColor(Magenta);
            Writeln('Ввод данных осуществлен успешно.');
          menu;
        end;
      '2':
        begin
          N := 0;
          sq := 0;
          x1 := downx;
          Ef := stepx * stepx * stepx;
          repeat
            inc(N);
            y1 := func(x1);
            x1 := x1 + stepx;
            y2 := func(x1);
            sq := sq + ((y1 + y2) / 2) * stepx - Ef;
          until x1 > upx;
          TextColor(Cyan);
          ClrScr;
          Writeln('Площадь вычисляемой фигуры равна: ', sq:0:4);
          menu;
        end;
      '3':
        begin
          Efn := N * stepx * stepx * stepx;
          TextColor(Brown);
          ClrScr;
          Writeln('Погрешность: ', Efn:0:4);
          menu;
        end;
    end;
  until key = '4'
end.