package BesicPro

import bitmascot.UserService
import com.amyApp.User
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.beans.factory.annotation.Autowired
import sun.nio.fs.WindowsUserPrincipals

@Secured('permitAll')
class RegisterUserController {
        @Autowired
        SpringSecurityService springSecurityService
        UserService userService


    def index() {
        def currentUser =  springSecurityService.currentUser
        User userInfo = User.get(currentUser.id)
        [userInfo: userInfo]
    }

    def newRegister () {

        render(view: 'registrationForm')
    }

    def createUser () {

        def user
        def ifExistUser = User.findByUsername(params.email)
        if (!ifExistUser) {
            user = new User(firstName: params.firssssstName, lastName: params.lastName, address: params.address,
                    phoneNo: params.phoneNo, dateOfBirth: params.dateOfBirth, username: params.email,
                    password: params.password)
            user.save(flash: true)

            flash.message = "Registration successfully !"

        } else {
            flash.message = "Registration fail !"
        }
        render(view: 'registrationForm')
    }

    def admin () {

    }

    def userGrid () {

        def users = User()
        users
        users
    }

   def changePasswordForm () {

   }

    def changePassword () {


        if (params.oldPassword && params.newPassword && params.confirmPassword) {
            def currentUser = springSecurityService.currentUser
            def user = User.get(currentUser.id)
            def oldPassword = userService.decrypt(user.password)
            if (user.password.equals(oldPassword)) {
                if ( params.newPassword ==  params.confirmPassword) {
                    user.password( params.newPassword)
                    user.save(flash: true)
                    flash.message = "Password change successfully!"
                } else {
                    flash.message = "New password and confirm password are not match!"
                }
            } else {
                flash.message = "Old password and new password are not match!"
            }
        }

        render (view: 'changePasswordForm')
    }

}
