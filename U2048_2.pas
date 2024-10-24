unit U2048_2;

interface
  procedure createwall(var board : array of integer;board_width : integer; board_height : integer);

  procedure createnumber(var board : array of integer; board_width : integer; board_height : integer);

  procedure upmove(var board : array of integer; board_width : integer; board_height : integer);
  procedure leftmove(var board : array of integer; board_width : integer; board_height : integer);
  procedure downmove(var board : array of integer; board_width : integer; board_height : integer);
  procedure rightmove(var board : array of integer; board_width : integer; board_height : integer);

  procedure absoluteboard(var board : array of integer; board_width : integer; board_height : integer);

implementation
  procedure createwall(var board : array of integer;board_width : integer; board_height : integer);
  var i : integer;
  begin
    for i := 0 to board_width + 1 do
    begin
      board[i] := -1;
      board[(board_height+1)*(board_width+2)+i] := -1;
    end;
    for i := 0 to board_height + 1 do
    begin
      board[i*(board_width+2)] := -1;
      board[i*(board_width+2)+(board_width+1)] := -1;
    end;
  end;

  procedure createnumber(var board : array of integer; board_width : integer; board_height : integer);
  var
    i : integer;
  begin
    while true do
    begin
      i := random((board_width+2)*(board_height+2));
      if board[i] = 0 then
        break;
    end;
    board[i] := 2;
  end;

  procedure upmove(var board : array of integer; board_width : integer; board_height : integer);
  var i, j, k : integer;
  is_change : boolean;
  begin
    is_change := false;

    for i := 1 to board_height do
    begin
      for j := 1 to board_width do
        begin
          k := 0;
          if board[i*(board_width+2)+j] <= 0 then
            continue;
          while true do
          begin
            k := k + 1;
            if board[i*(board_width+2)+j - k*(board_width+2)] <> 0 then
              break;
          end;
          if board[i*(board_width+2)+j - k*(board_width+2)] = board[i*(board_width+2)+j] then
          begin
            board[i*(board_width+2)+j - k*(board_width+2)] := board[i*(board_width+2)+j - k*(board_width+2)] * (-2);
            board[i*(board_width+2)+j] := 0;
            is_change := true;
          end
          else
          begin
            k := k - 1;
            if k > 0 then
            begin
              board[i*(board_width+2)+j - k*(board_width+2)] := board[i*(board_width+2)+j];
              board[i*(board_width+2)+j] := 0;
              is_change := true;
            end;
          end;
        end;
    end;

    absoluteboard(board, board_width, board_height);
    if is_change then
      createnumber(board, board_width, board_height);
  end;

  procedure leftmove(var board : array of integer; board_width : integer; board_height : integer);
  var i, j, k : integer;
  is_change : boolean;
  begin
    is_change := false;

    for i := 1 to board_height do
    begin
      for j := 1 to board_width do
        begin
          k := 0;
          if board[i*(board_width+2)+j] <= 0 then
            continue;
          while true do
          begin
            k := k + 1;
            if board[i*(board_width+2)+j - k] <> 0 then
              break;
          end;
          if board[i*(board_width+2)+j - k] = board[i*(board_width+2)+j] then
          begin
            board[i*(board_width+2)+j - k] := board[i*(board_width+2)+j - k] * (-2);
            board[i*(board_width+2)+j] := 0;
            is_change := true;
          end
          else
          begin
            k := k - 1;
            if k >0 then
            begin
              board[i*(board_width+2)+j - k] := board[i*(board_width+2)+j];
              board[i*(board_width+2)+j] := 0;
              is_change := true;
            end;
          end;
        end;
    end;

    absoluteboard(board, board_width, board_height);
    if is_change then
      createnumber(board, board_width, board_height);
  end;

  procedure downmove(var board : array of integer; board_width : integer; board_height : integer);
  var i, j, k : integer;
  is_change : boolean;
  begin
    is_change := false;

    for i := board_height downto 1 do
    begin
      for j := board_width downto 1 do
        begin
          k := 0;
          if board[i*(board_width+2)+j] <= 0 then
            continue;
          while true do
          begin
            k := k + 1;
            if board[i*(board_width+2)+j + k*(board_width+2)] <> 0 then
              break;
          end;
          if board[i*(board_width+2)+j + k*(board_width+2)] = board[i*(board_width+2)+j] then
          begin
            board[i*(board_width+2)+j + k*(board_width+2)] := board[i*(board_width+2)+j + k*(board_width+2)] * (-2);
            board[i*(board_width+2)+j] := 0;
            is_change := true;
          end
          else
          begin
            k := k - 1;
            if k>0 then
            begin
              board[i*(board_width+2)+j + k*(board_width+2)] := board[i*(board_width+2)+j];
              board[i*(board_width+2)+j] := 0;
              is_change := true;
            end;
          end;
        end;
    end;

    absoluteboard(board, board_width, board_height);
    if is_change then
      createnumber(board, board_width, board_height);
  end;

  procedure rightmove(var board : array of integer; board_width : integer; board_height : integer);
  var i, j, k : integer;
  is_change : boolean;
  begin
    is_change := false;

    for i := board_height downto 1 do
    begin
      for j := board_width downto 1 do
        begin
          k := 0;
          if board[i*(board_width+2)+j] <= 0 then
            continue;
          while true do
          begin
            k := k + 1;
            if board[i*(board_width+2)+j + k] <> 0 then
              break;
          end;
          if board[i*(board_width+2)+j + k] = board[i*(board_width+2)+j] then
          begin
            board[i*(board_width+2)+j + k] := board[i*(board_width+2)+j + k] * (-2);
            board[i*(board_width+2)+j] := 0;
            is_change := true;
          end
          else
          begin
            k := k - 1;
            if k > 0 then
            begin
              board[i*(board_width+2)+j + k] := board[i*(board_width+2)+j];
              board[i*(board_width+2)+j] := 0;
              is_change := true;
            end;
          end;
        end;
    end;

    absoluteboard(board, board_width, board_height);
    if is_change then
      createnumber(board, board_width, board_height);
  end;

  procedure absoluteboard(var board : array of integer; board_width : integer; board_height : integer);
  var i : integer;
  begin
    for i := 0 to (board_width+2)*(board_height+2)-1 do
    begin
      if board[i] < -1 then
        board[i] := 0-board[i];
    end;
  end;
end.
