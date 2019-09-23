import bitmascot.UserService
import com.amyApp.User
import com.amyApp.auth.Role
import com.amyApp.auth.UserRole

class BootStrap {
    UserService userService

    def init = { servletContext ->
        def authorities = ['ROLE_ADMIN']
        authorities.each {
            if ( !Role.findByAuthority(it) ) {
                new Role(authority: it).save()
            }
        }
        // Password make to HSA-256
        /*def getShaSrt = userService.getSHA('admin');
        def getHexStr = userService.toHexString(getShaSrt)*/

        if ( !User.findByUsername('admin@localhost.local') ) {
            def u = new User(username: 'admin@localhost.local', password: 'admin')
            u.save()

            def ur = new UserRole(user: u, role:  Role.findByAuthority('ROLE_ADMIN'))
            ur.save()
        }
    }

    def destroy = {

    }
}
