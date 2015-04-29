require_relative "address"
require_relative "admin"
require_relative "subscriber"
require_relative "wine"
require_relative "selection"


class VIN
  attr_accessor :users, :errors, :numUsers
  def initialize()
    @subscribers = []
    @errors = []
    @numUsers = 0
    @numSelections = 0
    @admins = []
    @wines = []
    @selections = []
    @DEFAULT_PRICE = 25.99
  end

  def getSubscriber(id)
    response = {}
    for i in @subscribers
      if i.id == id
        response['email'] = i.email
        response['name'] = i.name
        response['phone'] = i.phone
        response['address']['street'] = i.address.street
        response['address']['city'] = i.address.city
        response['address']['state'] = i.address.state
        response['address']['zip'] = i.address.zip
        return response
      end
    end

    @errors.push({code: 810, message: "invalid id"})
    response['id'] = nil
    response['errors'] = errors
    return response
  end

  def addSubscriber(name, email, phone, street, city, state, zip)
    response = {}
    zip = zip.to_i
    address = Address.new(street, city, state, zip)
    if !address.valid?
        @errors.push({code: 808, message: "invalid address"})
        response['id'] = nil
    else
        @numUsers += 1
        subs = Subscriber.new(numUsers, name, email, phone, address)
        if !subs.valid?
          @errors.push(code: 809, message: "invalid subscriber info")
          response['id'] = nil
        else
          response['id'] = subs.id
          @subscribers.push(subs)
        end
    end

    response['errors'] = errors
    return response
  end

  def updateSubscriber(id, name, email, phone, street, city, state, zip)
    response = {}
    for i in @subscribers
      if id.to_i == id
        zip = zip.to_i
        address = Address.new(street, city, state, zip)
        if address.valid?
          subs = Subscriber.new(id.to_i, name, email, phone, address)
          if !subs.valid
            @errors.push({code: 809, message: "invalid subscriber info"})
            status 204
            return response
          else
            response['errors'] = @errors
            i = subs
            return response
          end
        else
          @errors.push({code: 808, message: "invalid address"})
          status 204
          return response
        end
      end
    end
    status 404
    @errors.push({code: 800, message: "user not found"})
    response.push(@errors)
    return response
  end

  def addAdmin(name)
    response = {}
    admin = Admin.new(@numUsers += 1,name)
    if admin.valid?
      response['errors'] = @errors
      response['id'] = admin.id
      @admins.push(admin)
      return response
    else
      response['errors'] = @errors
      response['id'] = nil
      return response
    end
  end

  def getAdmins
    response = {}
    adminlist = []
    for i in @admins
      adminlist.push({id: i.id, name: i.name})
    end
    response['admins'] = adminlist
    if adminlist.empty?
      @errors.push({code: 819, address: "invalid admin info"})
      response['errors'] = @errors
    end
    return response
  end

  def getAdmin(id)
    response = {}
    for i in @admins
      if id.to_i == i.id
        response['id'] = id
        response['name'] = i.name
        return response
      end
    end
    @errors.push({code: 808, message: "user not found"})
    response['errors'] = @errors
    return response
  end

  def updateAdmin(id, name)
    response = {}
    for i in @admins
      if id.to_i == i.id
        ad = Admin.new(id.to_i, name)
        if ad.valid?
          i = ad
          response['errors'] = []
          return response
        end
      end
    end
    @errors.push({code: 808, message: "user not found"})
    response['errors'] = @errors
    return response
  end

  def getMonthlySelection
    response = {}
    selects = []
    for i in @selections
      selects.push{id: i.id, selection_month: i.month, type: i.type}
    end
    response['monthy_selection'] = selects
    return response
  end

  def postMonthlySelection(month, type, created, wines)
    response = {}
    selection = Selection.new(numSelections += 1, month, type, created, wines,
                              @DEFAULT_PRICE )
    if selection.valid?
      response['id'] = selection.id
      response['errors'] = []
      @selections.push(selection)
    else
      response['id'] = nil
      response['errors'] = []
    end
    return response
  end

  def getMonthlySelection(id)
    response = {}
    wines = []
    for i in @selections
      if i.id == id.to_i
        response['id'] = i.id
        response['selection_month'] = i.month
        response['type'] = i.type
        response['create_date'] = i.createDate
        response['created_by'] = i.createdBy
        for y in i.wines
          wines.push{id: y.id, :label_name y.labelName}
        end
        response['wines'] = wines
      end
    end
    return response
  end
end
