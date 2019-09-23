package bitmascot

import com.amyApp.User
import com.amyApp.auth.Role
import com.amyApp.auth.UserRole
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

@Transactional
class UserService {
    SpringSecurityService springSecurityService

    public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String toHexString(byte[] hash) {
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);

        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));

        // Pad with leading zeros
        while (hexString.length() < 32)
        {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }

    def createUser (Object params) {
        // This function for make password SHA by SHA-256
        /*def getShaSrt = userService.getSHA(params.password);
         def getHexStr = userService.toHexString(getShaSrt)*/

       User user = new User(firstName: params.firstName, lastName: params.lastName, address: params.address,
                    phoneNo: params.phoneNo, dateOfBirth: params.dateOfBirth, username: params.email,
                    password: params.password)
                    user.save(flash: true)

        def ur = new UserRole(user: user, role:  Role.findByAuthority('ROLE_USER'))
        ur.save()
        return
    }

    def updatePassword (Object params) {
        def currentUser = springSecurityService.currentUser
        def user = User.get(currentUser.id)
        user.password = params.newPassword
        user.passwordExpired = false
        user.save()
    }

    public List getAllUser(List<ArrayList> userList) {

        ArrayList addList = new ArrayList()
        bitmascot.GridEntity obj
        int counter = 0;

        try {
            for (int i = 0; i < userList.size(); i++) {

                obj = new bitmascot.GridEntity()
                obj.id = userList[i].id

               String firstName = userList[i].firstName ? userList[i].firstName : ""
               String lastName = userList[i].lastName ? userList[i].lastName : ""
               String phoneNo = userList[i].phoneNo ? userList[i].phoneNo : ""
               String address = userList[i].address ? userList[i].address : ""

                obj.cell = ["firstName":firstName,"lastName":lastName,
                            "userName":userList[i].username, "phoneNo":phoneNo,
                            "address":address]
                addList.add(obj)
                counter++;
            }
            return addList;

        } catch (Exception ex) {
            addList = [];
            return addList;
        }
    }

}