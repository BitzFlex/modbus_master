defmodule MM do
  @moduledoc """
  Documentation for `ModbusMaster`.
  """

  @doc """
    function 으로 주어신 내용을 실행한다.

    MM.op({:rir,1,0,14})
  """




  def op(op) do
    port = Application.get_env(:modbus_master, :port)
    {:ok, port_pid} = Modbux.Rtu.Master.start_link(tty: port , uart_opts: [speed: 9600] )

    result = Modbux.Rtu.Master.request(port_pid,op)

    Modbux.Rtu.Master.close(port_pid)
    Modbux.Rtu.Master.stop(port_pid)
    result
  end



end
