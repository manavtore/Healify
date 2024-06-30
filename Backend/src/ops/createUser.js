import prisma from '../prisma/Client'
import User from '../models/User'
import Record from '../models/Record'

const createUser = async (userData) => {
    try{
        const user = await prisma.user.create({
            data:{
                name:userData.name,
                username:userData.username,
                height:userData.height,
                weight:userData.weight,
                age:userData.age,
                bloodgroup:userData.bloodgroup,
                gender:userData.gender,
                record:{
                    create:userData.record.map(Record =>({
                        id:Record.id,
                        title:Record.title,
                        date:Record.date,
                        symptoms:Record.symptoms,
                        diagnosis:Record.diagnosis,
                        treatment:Record.treatment,
                        reports:{
                            create:Record.reports.map(File =>({
                                id:File.id,
                                bucketName:File.bucketName,
                                objectKey:File.objectKey,
                                content:File.content,
                                username:File.username,
                                metadata:File.metadata
                            }))
                        }
                    }))
                }
            }
        });
    }catch(e){
        print(e);
    }
}

export default createUser;