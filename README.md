<<<<<<< HEAD
<h1><span style="color:#2d7eea">README - Your LookML Project</span></h1>

<h2><span style="color:#2d7eea">LookML Overview</span></h2>

LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

LookML is powerful because it:

- **Is all about reusability**: Most data analysis requires the same work to be done over and over again. You extract
raw data, prepare it, deliver an analysis... and then are never able touse any of that work again. This is hugely
inefficient, since the next analysis often involves many of the same steps. With LookML, once you define a
dimension or a measure, you continue to build on it, rather than having to rewrite it again and again.
- **Empowers end users**:  The data model that data analysts and developers create in LookML condenses and
encapsulates the complexity of SQL, it and lets analysts get the knowledge about what their data means out of
their heads so others can use it. This enables non-technical users to do their jobs &mdash; building dashboards,
drilling to row-level detail, and accessing complex metrics &mdash; without having to worry about what’s behind the curtain.
- **Allows for data governance**: By defining business metrics in LookML, you can ensure that Looker is always a
credible single source of truth.

The Looker application uses a model written in LookML to construct SQL queries against a particular database that
business analysts can [Explore](https://docs.looker.com/r/exploring-data) on. For an overview on the basics of LookML, see [What is LookML?](https://docs.looker.com/r/what-is-lookml)

<h2><span style="color:#2d7eea">Learn to Speak Looker</span></h2>
R
A LookML project is a collection of LookML files that describes a set of related [views](https://docs.looker.com/r/terms/view-file), [models](https://docs.looker.com/r/terms/model-file), and [Explores](https://docs.looker.com/r/terms/explore).
- A [view](https://docs.looker.com/r/terms/view-file) (.view files) contains information about how to access or calculate information from each table (or
across multiple joined tables). Here you’ll typically define the view, its dimensions and measures, and its field sets.
- A [model](https://docs.looker.com/r/terms/model-file) (.model file) contains information about which tables to use and how they should be joined together.
Here you’ll typically define the model, its Explores, and its joins.
- An [Explore](https://docs.looker.com/r/terms/explore) is the starting point for business users to query data, and it is the end result of the LookML you are
writing. To see the Explores in this project, select an Explore from the Explore menu.

<h2><span style="color:#2d7eea">Exploring Data</span></h2>

Ad-hoc data discovery is one of Looker’s most powerful and unique features. As you evaluate use cases for your
trial, consider what business areas you would like to explore. Open the Explore menu in the main navigation to see
the Explores you are building.

<h2><span style="color:#2d7eea">The Development Workflow</span></h2>

To support a multi-developer environment, Looker is integrated with Git for version control. Follow [these directions](https://docs.looker.com/r/develop/git-setup)
to set up Git for your project. To edit LookML, expand the Develop drop-down and toggle on [Development Mode](https://docs.looker.com/r/terms/dev-mode). In
Development Mode, changes you make to the LookML model exist only in your account until you commit the
changes and push them to your production model.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
=======
# This repository is archived
The [extension-examples](https://github.com/looker-open-source/extension-examples) repository is the new home of Looker's Extension examples.

# Looker Extension Template (React/Redux & TypeScript)

This repository serves as a template for creating a new Looker Extension using React and Redux.

It uses [React](https://reactjs.org/) and [TypeScript](https://www.typescriptlang.org/) for writing your extension, the [React Extension SDK](https://github.com/looker-open-source/extension-sdk-react) for interacting with Looker, and [Webpack](https://webpack.js.org/) for building your code.

## Getting Started for Development

1. Clone or download a copy of this template to your development machine
2. Navigate (`cd`) to the remplate directory on your system
3. Install the dependencies with [Yarn](https://yarnpkg.com/).

    ```
    yarn install
    ```

    > You may need to update your Node version or use a [Node version manager](https://github.com/nvm-sh/nvm) to change your Node version.
4.  Start the development server
    ```
    yarn start
    ```

    Great! Your extension is now running and serving the JavaScript at http://localhost:8080/bundle.js.

    > __Note well:__ The webpack development server also supports https. To use, add the parameter --https to the start command
    `"start": "webpack-dev-server --hot --disable-host-check --https"`
    Should you decide to use https, you should visit the bundle URL you are running as there will likely be a certificate warning. The development server runs with a self-signed SSL certificate, so you will need to accept this to allow your browser to connect to it.

    The default yarn start command runs with hot module replacement working. Some changes will cause a full reload of the extension iframe. When this happens the extension framework connection will break. You should see an error. You will need to do a full page reload of the outer page.

    To run without hot module replacement run `yarn start-no-hot`

5. Now log in to Looker and create a new project.

   This is found under __Develop__ => __Manage LookML Projects__ => __New LookML Project__.

   You'll want to select "Blank Project" as your "Starting Point". You'll now have a new project with no files.

6. In your copy of the extension tablet you have `manifest.lkml` file.

    You can either drag & upload this file into your Looker project, or create a `manifest.lkml` with the same content. Change the `id`, `label`, or `url` as needed.

    ```
    application: my-great-extension {
      label: "My Great Extension"
      url: "http://localhost:8080/bundle.js"
    }
    ```

7. Create a `model` LookML file in your project. The name doesn't matter. The model and connection won't be used, and in the future this step may be eliminated.
    - Add a connection in this model. It can be any connection, it doesn't matter which.
    - [Configure the model you created](https://docs.looker.com/data-modeling/getting-started/create-projects#configuring_a_model) so that it has access to some connection.

8. Connect your new project to Git. You can do this multiple ways:
    - Create a new repository on GitHub or a similar service, and follow the instructions to [connect your project to Git](https://docs.looker.com/data-modeling/getting-started/setting-up-git-connection)
    - A simpler but less powerful approach is to set up git with the "Bare" repository option which does not require connecting to an external Git Service.

9.  Commit your changes and deploy your them to production through the Project UI.

10. Reload the page and click the `Browse` dropdown menu. You should see your extension in the list.
    - The extension will load the JavaScript from the `url` you provided in the `application` definition/
    - Reloading the extension page will bring in any new code changes from the extension template. (Webpack's hot reloading is not currently supported.)

## Deployment

The process above requires your local development server to be running to load the extension code. To allow other people to use the extension, we can build the JavaScript file and include it in the project directly.

1. In your extension project directory on your development machine you can build the extension with `yarn build`.
2. Drag and drop the generated `dist/bundle.js` file into the Looker project interface
3. Modify your `manifest.lkml` to use `file` instead of `url`:
    ```
    application: my-great-extension {
      label: "My Great Extension"
      file: "bundle.js"
    }
    ```
## Notes

- Webpack's module splitting is not currently supported.
- The template uses Looker's component library and styled components. Neither of these libraries are required so you may remove and replace them with a component library of your own choice,

## Related Projects

- [Looker React extension template](https://github.com/looker-open-source/extension-template-react)
- [Looker kitchensink extension template ](https://github.com/looker-open-source/extension-template-kitchensink)
- [Looker extension SDK for React](https://www.npmjs.com/package/@looker/extension-sdk-react)
- [Looker SDK](https://www.npmjs.com/package/@looker/sdk)
- [Looker Components](https://components.looker.com/)
- [Styled components](https://www.styled-components.com/docs)
>>>>>>> branch 'master' of https://github.com/Lucazz7/test-loocker
