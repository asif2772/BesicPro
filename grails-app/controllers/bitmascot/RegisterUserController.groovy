package bitmascot

import com.amyApp.User
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.beans.factory.annotation.Autowired
import java.security.MessageDigest

@Secured('permitAll')
class RegisterUserController {
        @Autowired
        SpringSecurityService springSecurityService
        UserService userService
        MessageDigest md = MessageDigest.getInstance("SHA-256");

    def index() {

        def currentUser =  springSecurityService.currentUser
        def roles = springSecurityService.getPrincipal().getAuthorities()
        if (roles[0].role.equals("ROLE_ADMIN")) {
            render(view: 'admin')
            return
        } else {
            User userInfo = User.get(currentUser.id)
            [userInfo: userInfo]
        }
    }

    def newRegister () {

        render(view: 'registrationForm')
    }

    def createUser () {

        def ifExistUser = User.findByUsername(params.email)
        if (!ifExistUser && params.password) {
            def createUser = userService.createUser(params)
            flash.message = "Registration successfully !"
        } else {
            flash.message = "Registration fail !"
        }
        render(view: 'registrationForm')
    }

    def admin () {

    }

    def userGrid () {

        def users = User.all
        String gridOutput
        List userList = userService.getAllUser(users)
        LinkedHashMap result = [draw: 1, data : userList.cell]
        gridOutput = result as JSON
        render gridOutput;
    }

   def changePasswordForm () {

   }

    def updatePassword() {

        def currentUser = springSecurityService.currentUser
        def user = User.get(currentUser.id)
        if (!user.username) {
            flash.message = 'Sorry, an error has occurred'
            render (view: 'changePasswordForm')
            return
        }

        String password = params.oldPassword
        String newPassword = params.newPassword
        String newPassword2 = params.confirmPassword
        if (!password || !newPassword || !newPassword2 || newPassword != newPassword2) {
            flash.message =
                    'Please enter your current password and a valid new password'
            render (view: 'changePasswordForm')
            return
        }

        if (!springSecurityService.passwordEncoder.isPasswordValid(user.password,
                password, null /*salt*/)) {
            flash.message = 'Current password is incorrect'
            render (view: 'changePasswordForm')
            return
        }

        if (springSecurityService.passwordEncoder.isPasswordValid(user.password, newPassword,
                null /*salt*/)) {
            flash.message =
                    'Please choose a different password from your current one'
            render (view: 'changePasswordForm')
            return
        }

        def updatePassword = userService.updatePassword(params)
        flash.message = 'Password changed successfully!'
        render (view: 'changePasswordForm')
    }

}
