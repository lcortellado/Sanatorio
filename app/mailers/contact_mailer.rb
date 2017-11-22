class ContactMailer < ApplicationMailer
default from: "SANSYS Carlos <luiscarlosortecabral@gmail.com>"

def contact_send(params)@parameters=params mail(to:'luiscarlosortecabal@gmail.com', subject:@parameters[:subject])
end
end
