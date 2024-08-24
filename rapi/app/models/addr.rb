# frozen_string_literal: true

# id: "aid:*"
#    name: "tanino",
#    birthday: "2018-03-18",
#    gender: 0,
#    address: "yokomaha city",
#    job: "会社員",
#    note: ""
#    enum gender: { male: 0, female: 1 }
# idcount: aidのカウント
class Addr
  def index
    addrs = []
    idcount = RedisObj.call('GET', "idcount")
    if not idcount
      return []
    end
    last = Integer(idcount) - 1
    (1..last).each{|n|
      aid = "aid:#{n}"
      data = RedisObj.call('HGETALL', aid)
      if data.nil?
        next
      end
      data[:aid] = aid
      addrs.push(data)
    }
    addrs
  end

  def add(params)
    idcount = RedisObj.call('GET', "idcount")
    if idcount.nil?
      RedisObj.call('SET', "idcount", "1")
      idcount = 1
    end

    aid = "aid:#{idcount}"
    RedisObj.call('HSET', aid, 'name', params[:name],
                               'birthday', params[:birthday],
                               'gender', params[:gender],
                               'address', params[:address],
                               'job', params[:job],
                               'note', params[:note])

    RedisObj.call('INCR', "idcount")
    aid
  end

  def set(aid, params)
    RedisObj.call('HSET', aid, 'name', params[:name],
                               'birthday', params[:birthday],
                               'gender', params[:gender],
                               'address', params[:address],
                               'jobs', params[:job],
                               'note', params[:note])
  end

  def get(aid)
    # idは"aid:から始まる"
    data = RedisObj.call('HGETALL', aid)
    data[:aid] = aid
    data
  end

  def delete(aid)
    if aid.nil?
      return
    end
    RedisObj.call('DEL', aid)
  end

end
