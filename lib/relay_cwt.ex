defmodule Relay_CWT do


  def readSetting do

    # port = Application.get_env(:modbus_master, :port)
    # {:ok, port_pid} = Modbux.Rtu.Master.start_link(tty: port , uart_opts: [speed: 9600] )
    # result = Modbux.Rtu.Master.request(port_pid,{:rhr, 1, 0, 4 })
    # Modbux.Rtu.Master.stop(port_pid)

    {:ok , [slave_id, rs , baud , parity]} = MM.op({:rhr, 1, 0, 4 })

    << rs485::1, _::15>> = << rs::16>>
    IO.puts "Slave ID : #{slave_id}, #{inspect (rs485 && "485" || "232")}, #{baud*100} , #{parity} "

  end


end
